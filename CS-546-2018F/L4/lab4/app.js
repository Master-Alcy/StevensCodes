const todoItems = require("./todo");

(async () => {
    //1st Task
    const createdTask1 = await todoItems.createTask("Ponder Dinosaurs",
    "Has Anyone Really Been Far Even as Decided to Use Even Go Want to do Look More Like?");
    console.log(createdTask1);
    
    //2nd Task
    await todoItems.createTask("Play Pokemon with Twitch TV",
        "Should we revive Helix?");
    const getAllTasks1 = await todoItems.getAllTasks();
    console.log(getAllTasks1);

    //remove 1st Task in list
    try {
        await todoItems.removeTask(getAllTasks1[0]._id);
    } catch (error) {
        console.log(error);
    }

    const getAllTasks2 = await todoItems.getAllTasks();
    console.log(getAllTasks2);

    //print all remainning tasks
    for (let aTask of getAllTasks2) {
        let updated = await todoItems.completeTask(aTask._id);
        console.log(updated);
    }

    //Database Cleaner for this lab.
    const getAllTask3 = await todoItems.getAllTasks();
    try {
        for (let bTask of getAllTask3) {
            await todoItems.removeTask(bTask._id);
        }
        console.log("Database cleaned. Program finished.")
    } catch (error) {
        console.log(error);
    }

})().catch(e => { console.error(e); });