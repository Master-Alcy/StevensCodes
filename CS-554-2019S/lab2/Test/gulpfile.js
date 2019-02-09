"use strict";
const gulp = require('gulp');
const imagemin = require('gulp-imagemin');
const uglify = require('gulp-uglify');
const sass = require('gulp-sass');
const concat = require("gulp-concat");
const cleanCSS = require("gulp-clean-css");
const autoPrefix = require("gulp-autoprefixer");
const rename = require("gulp-rename");
const miniHtml = require("gulp-htmlmin");
const browserSync = require('browser-sync').create();
const reload = browserSync.reload;

/*
    -- Top Level Functions --
    gulp.task - Define tasks
    gulp.src - Point to files to use
    gulp.dest - Point tp folder to output
    gulp.watch - Watch files and folders for changes
*/

// Logs Message
gulp.task('message', async () => {
    return console.log(`Gulp is running ...`);
});

// Copy All HTML files
gulp.task('copyHTML', async () => {
    gulp.src('src/*.html') // source files
        .pipe(miniHtml({
            collapseWhitespace: true
        }))
        .pipe(gulp.dest('public')); // destination
});

// Optimize Images
gulp.task('imageMin', async () => {
    gulp.src('src/images/*')
        .pipe(imagemin([
            imagemin.gifsicle({
                interlaced: true
            }),
            imagemin.jpegtran({
                progressive: true
            }),
            imagemin.optipng({
                optimizationLevel: 5
            }),
            imagemin.svgo({
                plugins: [{
                        removeViewBox: true
                    },
                    {
                        cleanupIDs: false
                    }
                ]
            })
        ]))
        .pipe(gulp.dest('public/images'))
});

// Compile Sass
gulp.task('procSASS', async () => {
    gulp.src('src/sass/*.sass')
        .pipe(sass().on('error', sass.logError))
        .pipe(concat("styles.css"))
        .pipe(gulp.dest('public/css'))
        .pipe(autoPrefix({
            browsers: ["last 2 versions"],
            cascade: false
        }))
        .pipe(cleanCSS())
        .pipe(rename("styles.min.css"))
        .pipe(gulp.dest("public/css"));
});

// Scripts, concat and minify js
gulp.task('procJS', async () => {
    gulp.src([
            'node_modules/jquery/dist/jquery.min.js',
            'src/js/tota11y.min.js',
            'node_modules/bootstrap/dist/js/bootstrap.bundle.min.js'
        ])
        .pipe(concat('main.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('public/js'));
});

// Build all files in series and in parallel
gulp.task('build', gulp.series(
    'message',
    gulp.parallel('imageMin', 'procSASS', 'copyHTML', 'procJS')
), (done) => {
    done();
});

// Watch
gulp.task('watch', async () => {
    gulp.watch('src/images/*', gulp.series('imageMin'));
    gulp.watch('public/images/*').on('change', reload);

    gulp.watch('src/js/*.js', gulp.series('procJS'));
    gulp.watch('public/js/*.js').on('change', reload);

    gulp.watch('src/sass/*.sass', gulp.series('procSASS'));
    gulp.watch('public/css/*.css').on('change', reload);

    gulp.watch('src/*.html', gulp.series('copyHTML'));
    gulp.watch('public/*.html').on('change', reload);

    console.log("Start watching ...");
});

// reload browser
gulp.task('server', async () => {
    browserSync.init({
        server: {
            baseDir: "./public/"
        }
    });
});

// Default task
gulp.task('default', gulp.series('server', 'watch'));