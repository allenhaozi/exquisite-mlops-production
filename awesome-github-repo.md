# Awesome of Awesome 

- [20 Amazing GitHub Repositories Every Developer Should Follow](https://towardsdatascience.com/20-amazing-github-repositories-every-developer-should-follow-d8ce4c728351)

- [Awesome Public Datasets](https://github.com/awesomedata/awesome-public-datasets)

- [Awesome MLOps](https://github.com/kelvins/awesome-mlops) 

- [Awesome production machine learning
](https://github.com/EthicalML/awesome-production-machine-learning)




![MLOps sketch](assets/mlops.png)

## metadata
* [DataHub](https://github.com/linkedin/datahub) ![](https://img.shields.io/github/stars/linkedin/datahub.svg?style=social)
```
DataHub is an open-source metadata platform for the modern data stack
```
* [openmetadata](https://github.com/open-metadata/openmetadata) ![](https://img.shields.io/github/stars/open-metadata/openmetadata.svg?style=social)
```
Metadata schemas - defines core abstractions and vocabulary for metadata with schemas for Types, Entities, Relationships between entities. This is the foundation of the Open Metadata Standard.

Metadata store - stores metadata graph that connects data assets, user, and tool generated metadata.

Metadata APIs - for producing and consuming metadata built on schemas for User Interfaces and Integration of tools, systems, and services.

Ingestion framework - a pluggable framework for integrating tools and ingesting metadata to the metadata store. Ingestion framework already supports well know data warehouses - Google BigQuery, Snowflake, Amazon Redshift, and Apache Hive, and databases - MySQL, Postgres, Oracle, and MSSQL.

OpenMetadata User Interface - one single place for users to discover, and collaborate on all data.
```
* [Amundsen](https://github.com/amundsen-io/amundsen) ![](https://img.shields.io/github/stars/amundsen-io/amundsen.svg?style=social)
```
Amundsen is a data discovery and metadata engine for improving the productivity of data analysts, data scientists and engineers when interacting with data. It does that today by indexing data resources (tables, dashboards, streams, etc.) and powering a page-rank style search based on usage patterns (e.g. highly queried tables show up earlier than less queried tables). Think of it as Google search for data. 
```

## feature store
* [feast](https://github.com/feast-dev/feast)  ![](https://img.shields.io/github/stars/feast-dev/feast.svg?style=social)
```
Feast is an open source feature store for machine learning.
Feast is the fastest path to productionizing analytic data for model training and online inference.
```
## Data orchestration
* [alluxio](https://github.com/Alluxio/alluxio) ![](https://img.shields.io/github/stars/Alluxio/alluxio.svg?style=social)
```
Alluxio (formerly known as Tachyon) is a virtual distributed storage system.
It bridges the gap between computation frameworks and storage systems,
enabling computation applications to connect to numerous storage systems through a common interface
```
* [fluid](https://github.com/fluid-cloudnative/fluid) ![](https://img.shields.io/github/stars/fluid-cloudnative/fluid.svg?style=social)
```
Fluid is an open source Kubernetes-native Distributed Dataset Orchestrator and Accelerator for data-intensive applications,
such as big data and AI applications
```
* [delta lake](https://github.com/delta-io/delta) ![](https://img.shields.io/github/stars/delta-io/delta.svg?style=social)
```
  a storage layer that brings scalable, ACID transactions to Apache Spark and other big-data engines
```
* [dagster](https://github.com/dagster-io/dagster) ![](https://img.shields.io/github/stars/dagster-io/dagster.svg?style=social) 
```
Dagster is a data orchestrator for machine learning, analytics, and ETL

Dagster lets you define pipelines in terms of the data flow between reusable, logical components, then test locally and run anywhere. With a unified view of pipelines and the assets they produce, Dagster can schedule and orchestrate Pandas, Spark, SQL, or anything else that Python can invoke.

Dagster is designed for data platform engineers, data engineers, and full-stack data scientists. Building a data platform with Dagster makes your stakeholders more independent and your systems more robust. Developing data pipelines with Dagster makes testing easier and deploying faster.
```

* [great_expectations](https://github.com/great-expectations/great_expectations) ![](https://img.shields.io/github/stars/great-expectations/great_expectations.svg?style=social)
```
Great Expectations helps data teams eliminate pipeline debt, through data testing, documentation, and profiling.

Software developers have long known that testing and documentation are essential for managing complex codebases. Great Expectations brings the same confidence, integrity, and acceleration to data science and data engineering teams.
```

## Training
```
No amount of experimentation can ever prove me right; a single experiment can prove me wrong. --Albert Einstein
```

### workflow
* [argo-workflows](https://github.com/argoproj/argo-workflows) ![](https://img.shields.io/github/stars/argoproj/argo-workflows.svg?style=social) 
```
Argo Workflows is an open source container-native workflow engine for orchestrating parallel jobs on Kubernetes. Argo Workflows is implemented as a Kubernetes CRD (Custom Resource Definition).
   Define workflows where each step in the workflow is a container.    
   Model multi-step workflows as a sequence of tasks or capture the dependencies between tasks using a directed acyclic graph (DAG).    
   Easily run compute intensive jobs for machine learning or data processing in a fraction of the time using Argo Workflows on Kubernetes.    
```

* [prefect](https://github.com/PrefectHQ/prefect) ![](https://img.shields.io/github/stars/PrefectHQ/prefect.svg?style=social)
```
Prefect is a new workflow management system, designed for modern infrastructure and powered by the open-source Prefect Core workflow engine. Users organize Tasks into Flows, and Prefect takes care of the rest.
```
* [mlflow](https://github.com/mlflow/mlflow) ![](https://img.shields.io/github/stars/mlflow/mlflow.svg?style=social)
```
MLflow is a platform to streamline machine learning development,   
including tracking experiments, packaging code into reproducible runs,  
and sharing and deploying models.     
MLflow offers a set of lightweight APIs that can be used with any existing machine learning application or library (TensorFlow, PyTorch, XGBoost, etc),       
wherever you currently run ML code (e.g. in notebooks, standalone applications or the cloud).     
MLflow's current components are:

MLflow Tracking:     
	An API to log parameters, code, and results in machine learning experiments and compare them using an interactive UI.
MLflow Projects:       
	A code packaging format for reproducible runs using Conda and Docker, so you can share your ML code with others.
MLflow Models:     
	A model packaging format and tools that let you easily deploy the same model (from any ML library) to batch and real-time scoring on platforms such as Docker, Apache Spark, Azure ML and AWS SageMaker.
MLflow Model Registry:      
	A centralized model store, set of APIs, and UI, to collaboratively manage the full lifecycle of MLflow Models.
```
* [airflow](https://github.com/apache/airflow) ![](https://img.shields.io/github/stars/apache/airflow.svg?style=social)
```
Apache Airflow (or simply Airflow) is a platform to programmatically author, schedule, and monitor workflows.

When workflows are defined as code, they become more maintainable, versionable, testable, and collaborative.

Use Airflow to author workflows as directed acyclic graphs (DAGs) of tasks.     
The Airflow scheduler executes your tasks on an array of workers while following the specified dependencies.      
Rich command line utilities make performing complex surgeries on DAGs a snap.     
The rich user interface makes it easy to visualize pipelines running in production, monitor progress, and troubleshoot issues when needed.
```

* [luigi](https://github.com/spotify/luigi) ![](https://img.shields.io/github/stars/spotify/luigi.svg?style=social)
```
Luigi is a Python (3.6, 3.7, 3.8, 3.9 tested) package that helps you build complex pipelines of batch jobs.      
It handles dependency resolution, workflow management, visualization, handling failures, command line integration, and much more.
```
* [mlrun](https://github.com/mlrun/mlrun) ![](https://img.shields.io/github/stars/mlrun/mlrun.svg?style=social)
```
MLRun is an open-source MLOps framework that offers an integrative approach to managing your machine-learning pipelines from early development through model development to full pipeline deployment in production. MLRun offers a convenient abstraction layer to a wide variety of technology stacks while empowering data engineers and data scientists to define the feature and models.
```
## logging
+ [whylogs](https://github.com/whylabs/whylogs)

## compute
+ [triton](https://github.com/openai/triton) ![](https://img.shields.io/github/stars/openai/triton.svg?style=social) 
```
This is the development repository of Triton, a language and compiler for writing highly efficient custom Deep-Learning primitives. The aim of Triton is to provide an open-source environment to write fast code at higher productivity than CUDA, but also with higher flexibility than other existing DSLs.
```
+ [horovod](https://github.com/horovod/horovod) ![](https://img.shields.io/github/stars/horovod/horovod.svg?style=social)
```
Horovod is a distributed deep learning training framework for TensorFlow, Keras, PyTorch, and Apache MXNet. The goal of Horovod is to make distributed deep learning fast and easy to use.
```

# model

## Model Explainability
+ [InterpretML](https://github.com/interpretml/interpret/) ![](https://img.shields.io/github/stars/interpretml/interpret.svg?style=social) 
```
In the beginning machines learned in darkness, and data scientists struggled in the void to explain them.
Let there be light.
InterpretML is an open-source package that incorporates state-of-the-art machine learning interpretability techniques under one roof. With this package, you can train interpretable glassbox models and explain blackbox systems. InterpretML helps you understand your model's global behavior, or understand the reasons behind individual predictions.

Interpretability is essential for:

Model debugging - Why did my model make this mistake?
Feature Engineering - How can I improve my model?
Detecting fairness issues - Does my model discriminate?
Human-AI cooperation - How can I understand and trust the model's decisions?
Regulatory compliance - Does my model satisfy legal requirements?
High-risk applications - Healthcare, finance, judicial, ...
```
+ [shap](https://github.com/slundberg/shap) ![](https://img.shields.io/github/stars/slundberg/shap.svg?style=social)
```
SHAP (SHapley Additive exPlanations) is a game theoretic approach to explain the output of any machine learning model. It connects optimal credit allocation with local explanations using the classic Shapley values from game theory and their related extensions (see papers for details and citations).
```

+ [lime](https://github.com/marcotcr/lime) ![](https://img.shields.io/github/stars/marcotcr/lime.svg?style=social)
```
This project is about explaining what machine learning classifiers (or models) are doing. At the moment, we support explaining individual predictions for text classifiers or classifiers that act on tables (numpy arrays of numerical or categorical data) or images, with a package called lime (short for local interpretable model-agnostic explanations). Lime is based on the work presented in this paper (bibtex here for citation). Here is a link to the promo video:
```
+ [eli5](https://github.com/TeamHG-Memex/eli5) ![](https://img.shields.io/github/stars/TeamHG-Memex/eli5.svg)
```
ELI5 is a Python package which helps to debug machine learning classifiers and explain their predictions.

```

## Data and Model Monitoring
+ [Fairlearn](https://github.com/fairlearn/fairlearn) ![](https://img.shields.io/github/stars/fairlearn/fairlearn.svg?style=social) 
```
Fairlearn is a Python package that empowers developers of artificial intelligence (AI) systems to assess their system's fairness and mitigate any observed unfairness issues.    
Fairlearn contains mitigation algorithms as well as metrics for model assessment.     
Besides the source code, this repository also contains Jupyter notebooks with examples of Fairlearn usage.   
```
+ [Great Expectations](https://github.com/great-expectations/great_expectations) ![](https://img.shields.io/github/stars/great-expectations/great_expectations.svg?style=social)
```
Great Expectations helps data teams eliminate pipeline debt, through data testing, documentation, and profiling.     
Software developers have long known that testing and documentation are essential for managing complex codebases.    
Great Expectations brings the same confidence, integrity, and acceleration to data science and data engineering teams.    
```