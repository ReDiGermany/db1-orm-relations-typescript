import "reflect-metadata";
import { createConnection } from "typeorm";

createConnection()
  .then((connection) => {
    console.log("ok");
  })
  .catch((error) => console.log(error));
