
# data preparation

### Sourcing Data(storage)
Data can live in various data stores, with different access permissions, and can be littered with personally identifiable information (PII).

### Completeness
needed to determine if the data collected can be turned into meaningful
features
1. it is important to understand the length of historical data available to be used. 
This helps understand if the model builder has enough data for training purposes (a year’s worth of data, etc). 
Having data that has seasonal cycles and identified anomalies can help the model build resiliency.
2. Data completeness can also include checking if the data has proper labels.
Many companies have problems with the raw data in terms of cleanliness.
There can be multiple labels that mean the same thing. There will be some
data that is unlabeled or mislabeled. A number of vendors offer Data Labeling
services that employ a mix of technology and people to add labels to data and
clean up issues.
3. It is also important to have some check on whether the data seen is a
representative distribution. Was the data collected over an unusual period of
time? This is a tougher question because it is specific to the business and data
will continue to change over time.

### Data Processing
Once the data is collected and there is enough data across time with the
proper labels, there can be a series of data transforms to go from raw data
to features the model can understand. 
This stage is specific to the types of data that the business is using. 
For categorical values, it is common practice
to use one-hot encoding. For numeric values, there can be some form for
normalization based on the distribution of the data. A key part of this process
is to understand your data, including data distributions.

