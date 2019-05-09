function postedBy(parent, args, context) {
    return context.prisma.blog({ id: parent.id }).postedBy();
}

function comments(parent, args, context) {
    return context.prisma.blog({ id: parent.id }).comments();
}

function tags(parent, args, context) {
    return context.prisma.blog({ id: parent.id }).tags();
}

module.exports = {
    postedBy,
    comments,
    tags
}