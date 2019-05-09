function postedBy(parent, args, context) {
    return context.prisma.blog({ id: parent.id }).postedBy();
}

function comments(parent, args, context) {
    return context.prisma.blog({ id: parent.id }).comments();
}

function relatedTag(parent, args, context) {
    return context.prisma.blog({ id: parent.id }).relatedTag();
}


module.exports = {
    postedBy,
    comments,
    relatedTag
}