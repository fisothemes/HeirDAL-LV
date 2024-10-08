# HierDAL-LV

HierDAL is a library that provides a hierarchical database abstraction layer, emulating HDF5 functionalities using SQLite as the backend. It facilitates efficient storage, retrieval, and management of structured experimental data, with support for metadata and reliable data appending.

## Why HierDAL-LV?

Although HDF5 is a powerful and widely used format for managing large and complex datasets, existing implementations have several limitations that can reduce its effectiveness in certain scenarios:

- **Appending Data Issues**: HDF5 does not reliably support data appending. Workarounds often fail during power failures or unexpected shutdowns, leading to data corruption.
- **Complexity**: HDF5's advanced features, while powerful, can introduce unnecessary complexity for projects that do not require them.
- **Lack of Lightweight Alternatives**: For applications that need a hierarchical data structure without the overhead of a fully-fledged database server, HDF5 may be excessive.

**HierDAL-LV** was developed to address these shortcomings by providing a lightweight, reliable, and easy-to-use alternative for hierarchical data management using SQLite. By leveraging SQLite’s robustness and simplicity, HierDAL-LV ensures data integrity, especially during append operations, and offers a more straightforward API for managing groups, datasets, and metadata.

## Features

- **Hierarchical Data Management**: Organise data into nested groups and datasets, reflecting complex experimental workflows.
- **Metadata Support**: Attach key-value metadata to both groups and datasets for enhanced data description and retrieval.
- **Reliable Appending**: Safely append data with SQLite's transactional support, minimising the risk of data corruption.
- **Lightweight**: Utilises SQLite, requiring no additional database server, making it ideal for embedded applications and environments with limited resources.
- **Easy Integration**: Simple and intuitive API designed for seamless integration into C# projects.
- **Flexible Schema Definitions**: Define custom schemas for datasets, allowing for structured and typed data storage.
- **Automatic Schema Initialisation**: Automatically sets up the necessary database schema upon initialisation.
- **Thread-Safe Operations**: Designed to handle concurrent operations safely.

## Project Structure

HierDAL-LV follows a modular architecture to ensure maintainability and scalability. Below is an overview of the project structure:

```mathematica
HierDAL-LV/
├── src/
│   └── HierDAL Class/
│       └── Database Library/
│           ├── Database Manager Class/
│           └── Repositories Library/
│               ├── Objects Class/
│               ├── Attributes Class/
│               └── Dataset Columns Class/
├── tests/
├── samples/
├── docs/
│   └── (Documentation Files)
├── .gitignore
├── README.md
└── LICENCE
```

- **HierDAL (Class)**: The main service class that provides high-level APIs for interacting with the hierarchical database.
- **Database (Library)**: Contains classes related to database management and data repositories.
  - **DatabaseManager (Class)**: Manages the SQLite connection and initialises the database schema.
  - **Repositories (Library)**: Encapsulates CRUD operations for different entities.
    - **ObjectsRepository (Class)**: Handles operations related to Groups and Datasets.
    - **AttributesRepository (Class)**: Manages metadata associated with objects.
    - **DatasetColumnsRepository (Class)**: Manages schema definitions for datasets.

## Status

HierDAL-LV is currently a work in progress. While the foundational features for hierarchical data management, metadata support, and reliable data appending are being actively developed, additional functionalities, optimisations, and comprehensive testing are ongoing.
