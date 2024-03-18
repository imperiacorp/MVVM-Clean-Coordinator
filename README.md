# SwiftUI+Coordinator+MVVM+Clean

![Clean Structure](/README_FILES/CleanArchitectureDependencies.png)

## Structure
The skeleton of the project is based on the modular architecture MVVM + C with clean architecture principles. It is based on a microservice idea, where each flow user will be a separate service. The principle of DependencyInjection is at the core of all dependencies. The directories in the project are divided into the following layers:
* Application - the most essential services 
    * Config - application configuration files
    * Extensions - various useful class extensions
    * Core - core classes that are used throughout the application
    * DIContainer - classes that are responsible for recording, deciding, and settling all the dependencies
* Coordinator - classes for coordinator and routing.
* Data:
    * Requests - classes constructors of network requests 
    * UseCases - contain application-specific business rules and orchestrate the flow of data between the entities and the external world. 
    * Entities - are the core of the application and represent the business logic
    * Interfaces - for storing global constants
        * Repositories (interfaces)
* Domain:
    * Network - directory with classes for networking
    * Repositories (implementations)
    * Storage - directory with classes for storage (CoreData, Realm, UserDefaults etc.)
* Presentation - layer for all flows with modules and controllers
* Resources - for storing core resources (localization, fonts, images, colors)

![Folder Skeleton](/README_FILES/ProjectStructure.png)

The application life cycle begins with the MVVM_CleanApp, where the AppCorrdinator starts. . The coordinator pattern allows you to facilitate and decompose the routing of all screens within an application. The main coordinator of the AppCoordinator defines the entry point of the application.

Each module consists of an MVVM architecture standard and it has own transion object which sends signals to the coordinator. There is a main ApplicationCoordinator which contains subcoordinators.

To summarize, the basic rules for scaling the architecture should be highlighted.
* We try to follow the SOLID principles.
* Each service should have its own area of responsibility: for example, the Auth service will be responsible for working specifically with authorization, registration, etc. User service will be responsible specifically for working with user data, no matter if it's networking or a database.
* Each coordinator works only with his own flow, the file size does not exceed 500 lines. Otherwise, we create a SubCoorinator according to the principle of the main coordinator's work with its subcoordinators.
* Following the decomposition, we try not to overload services, presenters and controllers. Where can we break it down into separate entities and services.
* For the privacy of individual classes, we work through protocols.

Developed By
------------

* Honchar Dmytro, CHI Software


License
--------

Copyright 2021 CHI Software.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

