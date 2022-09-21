### Rules

- Clone this repo and create your branch for implementing the solution and upon completion, push the Branch to remote.
- Complete the challenge within five days, mention time spent in hours explicitly taken for solving the challenge
- Your solution should be clean, readable, maintainable, and implemented with an emphasis on DevOps methodologies.
- You are free to use the programming language, tools, and cloud platform of your choice.
- Provide a description, execution steps, and testing steps in a plain text file (EXECUTION-STEPS.txt)
- We are not looking for completion or perfection, we expect trade-offs to happen.
- Submit all the codebase, diagrams, and documents
- Bonus points: For the solutions built with a best security practice


### Prerequisites

- You need a GitHub account to push your branch (submit your solution) to remote.
- You might need an AWS/Azure/GCP account. Create one if you do not own one already. You can use free-tier resources for this test.

### Challenge

CareerFoundry wants to move from its highly coupled architecture to one more abstract. As our product grows fast, we must ensure that our platform scales appropriately.
The current structure of the platform is a Ruby on Rails[v6.0, v3.0] which provides a frontend using React and is connected to a Postgresql DB.
Your team fellows of the platform team, backend engineer, and frontend engineer are working separately on the API Gateway(using a pure rails API and a PostgreSQL DB), frontend(using react)
And they have created a collaborative monorepo. 

- What will be the git branching strategy? Elaborate why & why not with pros and cons
- What will be your build promotion plans (dev - QA - prod)
- Provide CI/CD implementation plans with stages
- How will you manage module version dependencies

 
### Expect to be asked these questions in the technical fit.
1. What would you, as the sole member of the DevOps team, do to best support this team now?
2. How would your priorities change as this project matures over time?
3. What about when it starts being used by end-users?
4. What if the DevOps team grew to have three total members?
