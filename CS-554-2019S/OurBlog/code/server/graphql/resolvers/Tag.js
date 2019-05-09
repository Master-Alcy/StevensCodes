function postedBy(parent, args, context) {
    return context.prisma.tag({ id: parent.id }).postedBy();
}

module.exports = {
    postedBy
}