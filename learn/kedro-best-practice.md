+ Split your catalog files into multiple YAML files for maintainability
+ Use TemplatedConfigLoader straight away
+ Design code to be readable 6 months later - write code for someone else to read, even if that person is future you!
+ Keep nodes simple and to the point
+ Avoid dynamic DAG creation in Kedro unless you really have to
+ If you have to, ensure that the DAG is structurally immutable and only differs in terms of dataset flow.
+ Most extensions to Kedro can and should happen via a Hook
+ Use pre-commit hooks in your workflow (check out what we do in the Kedro repo if you need inspiration)
+ Write tests with fabricated data, use something like Great Expectations for defensive checks at run time