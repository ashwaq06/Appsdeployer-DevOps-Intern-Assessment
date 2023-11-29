
# Appsdeployer-DevOps-Intern-Assessment

**Objective:** Create a Dockerfile for a simple web application.

**Instructions:** Imagine you have a basic web application written in Node.js.

The `Node.js` application chosen for writing the `Dockerfile` is sourced from the below GitHub repository 
https://github.com/ashwaq06/node-todo

## Dockerfile Overview

Here's a breakdown of the Dockerfile created for this assessment:

```Dockerfile
FROM node:14-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

RUN groupadd -r nodejs && useradd -m -r -g nodejs ashwaq

RUN chown -R ashwaq:nodejs /app

USER ashwaq

CMD ["node", "server.js"]

```

**Base Image:**

The Dockerfile uses the official Node.js base image `(node:14-slim)`.

**Working Directory:**

The working directory inside the container is set to `/app`.

**Copying Application Code:**

The `package.json` are copied into the container to manage application dependencies (`COPY package*.json ./`). The entire application code is then copied into the container(`COPY . .`).

**Installing the Dependencies:**

`RUN npm install` command for installing the required dependencies.

**Expose Port:**

Port `3000` is exposed to allow external access to the web application.

**Non-Root User:**

A `non-root user` named `ashwaq `is created, belonging to the `nodejs` group. This is done for security purposes to minimize potential vulnerabilities.

**Ownership and Permissions:**

The ownership of the `/app` directory and its contents is changed to the `ashwaq` user and the `nodejs` group.

**Command to Run the Application:**

The final command specifies that the application should be run using the node command, launching the `server.js` file (`CMD ["node", "server.js"]`).


![image](https://github.com/ashwaq06/Appsdeployer-DevOps-Intern-Assessment/assets/80192952/a31374fc-08f0-45ef-8f91-d845215faa8e)

## Building Docker Image 

By running the following command we can build the Docker Image from the Dockerfile we have written
```bash
docker build -t my-node-app .
```
- `-t` refers to tagging the image with a name `my-node-app`

- `.` refers to indicating the docker that my `Dockerfile` is present in the `current directory`

![image](https://github.com/ashwaq06/Appsdeployer-DevOps-Intern-Assessment/assets/80192952/8cf1652f-c23f-448f-a513-2f39d969ce19)



### Thank you ❤️
