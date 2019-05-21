function postedBy(parent, args, context) {
    return context.prisma.comment({ id: parent.id }).postedBy();
}

function forBlog(parent, args, context) {
    return context.prisma.comment({ id: parent.id }).forBlog();
}

module.exports = {
    postedBy,
    forBlog
}