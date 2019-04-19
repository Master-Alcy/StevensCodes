// const mongoData = require('./mongodb/mongoCollections');

// module.exports = mongoData;

const { prisma } = require('./prisma/hello-world/generated/prisma-client');

async function main() {
    const newLink = await prisma.createLink({
        url: 'www.prisma.test',
        description: 'Prisma Testing'
    });
    console.log(`Created new link: ${newLink.url} (ID: ${newLink.id})`);

    const allLinks = await prisma.links();
    console.log(allLinks);
    console.log("======================");
}

console.log("+++++++++++++++++++++++++");
main().catch(e => console.error(e));
main().catch(e => console.error(e));
main().catch(e => console.error(e));