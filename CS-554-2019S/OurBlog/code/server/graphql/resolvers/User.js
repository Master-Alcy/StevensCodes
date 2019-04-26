function blogs(parent, args, context) {
    return context.prisma.user({ id: parent.id }).blogs();
}

function comments(parent, args, context) {
    return context.prisma.user({ id: parent.id }).comments();
}

module.exports = {
    blogs,
    comments
}