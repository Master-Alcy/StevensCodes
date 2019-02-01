const gulp = require('gulp');
const imagemin = require('gulp-imagemin');
const uglify = require('gulp-uglify');
const sass = require('gulp-sass');
const concat = require("gulp-concat");
const cleanCSS = require("gulp-clean-css");
const autoPrefix = require("gulp-autoprefixer");
const rename = require("gulp-rename");

/*
    -- Top Level Functions --
    gulp.task - Define tasks
    gulp.src - Point to files to use
    gulp.dest - Point tp folder to output
    gulp.watch - Watch files and folders for changes
*/

// development mode?
const devBuild = (process.env.NODE_ENV !== 'production');
console.log(`Are we in development: ${devBuild}`);
const folder = {
    src: 'src/',
    build: 'dist/'
}

const sassFiles = [
    "./src/styles/something"
];

// Logs Message
gulp.task('message', async () => {
    return console.log(`Gulp is running ...`);
});

// Copy All HTML files
gulp.task('copyHTML', async () => {
    gulp.src('src/*.html') // source files
        .pipe(gulp.dest('dist')); // destination
});

// Optimize Images
gulp.task('imageMin', async () =>
    gulp.src('src/images/*')
    .pipe(imagemin())
    .pipe(gulp.dest('dist/images')));

// Minify JS
gulp.task('minify', async () => {
    gulp.src('src/js/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('dist/js'));
});

// Compile Sass
gulp.task('sass', async () => {
    gulp.src('src/sass/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(gulp.dest('dist/css'));
});

// Scripts
gulp.task('scripts', async () => {
    gulp.src('src/js/*.js')
        .pipe(concat('main.js'))
        .pipe(uglify())
        .pipe(gulp.dest('dist/js'));
});

// Build all files in series and in parallel
gulp.task('build', gulp.series('message', gulp.parallel('imageMin', 'sass', 'copyHTML', 'scripts'), 'message'), (done) => {
    console.log("everything done");
    done();
});

// Default task
gulp.task('default', async () => {
    console.log("This is defualt ...");
});

// Watch
gulp.task('watch', async() => {
    gulp.watch('src/images/*', gulp.series('imageMin'));
    gulp.watch('src/js/*.js', gulp.series('scripts'));
    gulp.watch('src/sass/*.scss', gulp.series('sass'));
    gulp.watch('src/*.html', gulp.series('copyHTML'));
});