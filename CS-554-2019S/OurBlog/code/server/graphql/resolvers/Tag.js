function blogs(parent, args, context) {
    return context.prisma.tag({ id: parent.id }).blogs();
}

module.exports = {
    blogs
}