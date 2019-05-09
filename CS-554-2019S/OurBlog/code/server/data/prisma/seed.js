const { prisma } = require('./generated/prisma-client');
const bcrypt = require('bcryptjs');
const Mock = require('mockjs');
const Random = Mock.Random;

async function main() {
    // Note admin only need to be created once
    const admin = await prisma.createUser({
        name: "admin",
        password: bcrypt.hashSync("fake", 10),
        email: "admin@fake",
        phone: "8001115555",
        address: "123 fake ST, APT 10, DUDETOWN, DT 123456",
        interest: "read hiking"
    });// end user seed
    console.log(`<Log>[${new Date().toUTCString()}]: admin user created: ${JSON.stringify(admin)}`);

    for (let i = 0; i < Random.natural(2, 4); i++) {
        const newBlog = await prisma.createBlog({
            title: Random.title(2, 6),
            article: Random.paragraph(1, 5),
            likes: Random.natural(0, 30),
            postedBy: {
                connect: {
                    email: "admin@fake"
                }
            }
        });
        console.log(`<Log>[${new Date().toUTCString()}]: Created new blog: ${JSON.stringify(newBlog)}`);

        for (let j = 0; j < Random.natural(1, 6); j++) {
            const newComment = await prisma.createComment({
                content: Random.sentence(3, 12),
                likes: Random.natural(0, 10),
                postedBy: {
                    connect: {
                        email: "admin@fake"
                    }
                },
                forBlog: {
                    connect: {
                        id: newBlog.id
                    }
                }
            });
            console.log(`<Log>[${new Date().toUTCString()}]: Created new comment: ${JSON.stringify(newComment)}`);
        }// end comment seed

        for (let k = 0; k < Random.natural(1, 3); k++) {
            const newTag = await prisma.createTag({
                tag: Random.word(2, 4),
                blogs: {
                    connect: {
                        id: newBlog.id
                    }
                }
            });
            console.log(`<Log>[${new Date().toUTCString()}]: Created new tag: ${JSON.stringify(newTag)}`);
        }// end tag seed
    }// end blog seed
    console.log("=====================Finished========================");
}

main().catch(e => console.error(e));