import { Application, Request, Response } from "express";

const taskRoutes = require("./taskRoute");

const constructorMethod = (app: Application) => {
  app.use("/api/tasks", taskRoutes);

  app.use("*", (req: Request, res: Response) => {
    res.sendStatus(404).json({ error: "Not found in routes/index.js" });
  });
};

module.exports = constructorMethod;
