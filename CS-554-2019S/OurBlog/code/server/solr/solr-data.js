let solrClient = require('./solr-config');

var data = {
    id: "123456789",
    blog_title: "wednesday of a fri",
    blog_text: `So{} you want to head to Macau but don’t want to spend a small fortune? It’s not just all expensive luxury accommodation and frittering away your hard-earned in the opulent casinos. Truth be told, you can do Macau on a budget – it simply takes a planning.

    Macau is an autonomous territory that is connected to the Chinese mainland. It’s known as the Las Vegas of Asia – a place where people go for gambling and glitz. But it’s much more than that. It has a rich history, stunning architecture, and plenty of waterside vistas to explore.
    
    If you’re organized, you can see a lot of Macau in just a day, otherwise, it’s the perfect spot for a long weekend. In Macau, the currency is the Macanese Pataca (MOP), or Hong Kong Dollars (HKD) are also widely accepted as well. Let’s take a look at how you can keep your costs down in this exciting city.`
};

async function update(document)
{
    try
    {
        let result = await solrClient.update(document);
        await solrClient.commit();
        console.log("success" + JSON.stringify(result));

        if(result.responseHeader.status === 0)
        {
            return true;
        }
    }
    catch(e)
    {
        console.log("error" + e);
    }

    return false;
}

async function createSolrCompatibleDocument(id, title, text)
{
    let document = {
        id: id,
        blog_title: title,
        blog_text: text
    };

    let titleWords = title.split(" ");

    document["blog_title_search"] = titleWords;

    return document;
}

async function deleteDocument(id)
{
    try
    {
        let result = await solrClient.delete({ "id": id });
        await solrClient.commit();

        if(result.responseHeader.status === 0)
        {
            return true;
        }
    }
    catch(e)
    {
        console.log(e);
    }
    
    return false;
}

async function queryTitle(text)
{
    let query = `blog_title:"${text}" OR blog_title:*${text}* `;

    let searchTermTokens = text.split(" ");

    if(searchTermTokens.length > 1)
    {
        for(let i in searchTermTokens)
        {
            query = query + `blog_title:"${searchTermTokens[i]}" OR blog_title:*${searchTermTokens[i]}* `;
        }
    }

    // console.log(query);

    let solrQuery = solrClient.query().q(query);
    let result = await solrClient.search(solrQuery);
    let documents = await createResultDocuments(result.response.docs);

    return documents;
}

async function queryText(text)
{
    let query = `blog_text:"${text}" OR blog_text:"*${text}*"`;
    // console.log(query);

    let solrQuery = solrClient.query().q(query);
    let result = await solrClient.search(solrQuery);
    let documents = await createResultDocuments(result.response.docs);

    return documents;
}

async function queryAll(text)
{
    let documents = await queryTitle(text);
    let textResult = await queryText(text);

    for(let i in textResult)
    {
        documents.push(textResult[i]);
    }

    return documents;
}

async function createResultDocuments(results)
{
    let documents = [];

    for(let i in results)
    {
        let resultDocument = {
            id: results[i].id,
            title: results[i].blog_title,
            text: results[i].blog_text
        }

        documents.push(resultDocument);
    }

    return documents;
}

module.exports = { update, createSolrCompatibleDocument, deleteDocument, queryTitle, queryText, queryAll, createResultDocuments }

// async function main()
// {
//     update(await createSolrCompatibleDocument(data.id, data.blog_title, data.blog_text));
//     let documents = await queryAll("midweek");

//     for(let i in documents)
//     {
//         console.log(documents[i]);
//     }
// }

// main();

