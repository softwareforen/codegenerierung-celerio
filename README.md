*Prerequisites:*

* [Java Development Kit 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Maven 3.3.3](https://maven.apache.org/download.cgi)
* [Npm 3.x.x](https://nodejs.org/en/) it comes with Node.js.

### Run these commands to generate and run an Angular 2 web app:

> **Note**: Downloading Maven dependencies + JavaScript dependencies may be long, so please be patient the first time you run these commands.

    git clone git@github.com:softwareforen/codegenerierung-celerio.git
    cd codegenerierung-celerio
    mvn -Pdb,metadata,gen generate-sources
    cd src/main/webapp
    npm install
    npm run tsc
    cd ../../..
    mvn spring-boot:run

Then open [http://localhost:8080/](http://localhost:8080/)

### Read the tutorial

A tutorial for using Celerio with this template pack can be found on [https://blog.softwareforen.de/2017/12/codegenerierung-mit-celerio-ein-tutorial](https://blog.softwareforen.de/2017/12/codegenerierung-mit-celerio-ein-tutorial)

### About the project

This projects comprises 2 parts, the code generation templates and a quickstart.

#### Code Generation Templates

The [pack-angular](https://github.com/softwareforen/codegenerierung-celerio/blob/master/pack-angular) folder contains Celerio dynamic/static templates, interpreted/copied 
by [Celerio](https://github.com/jaxio/celerio), an Open Source `code generator` that reverses relational database schema. 

These templates are meant to generate a CRUD web application relying on:

* [Angular 2 RC.4](http://angular.io/) web framework
* [TypeScript](https://www.typescriptlang.org/)
* [PrimeNG beta.10](http://primefaces.org/primeng/)
* [Spring Boot](http://projects.spring.io/spring-boot/)
* [Spring Security](http://projects.spring.io/spring-security/)
* [Spring Data JPA](http://projects.spring.io/spring-data-jpa/)

> **Note**:  The templates provided here were modified for the purpose of this tutorial. The [original Angular2 template-pack](https://github.com/jaxio/celerio-angular-quickstart) is maintained by [Jaxio](http://www.jaxio.com/en).
