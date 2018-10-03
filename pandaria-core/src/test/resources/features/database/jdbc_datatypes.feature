@database
Feature: jdbc data types
  test if we can handle different kinds of jdbc data types
  https://www.cis.upenn.edu/~bcpierce/courses/629/jdkdocs/guide/jdbc/getstart/mapping.doc.html

  Background:
    * dir: features/database

  Scenario: different db types
    * execute sql: all_data_types.sql

    * query:
    """
    select `varchar` from all_data_types;
    """
    * verify: '$[0].varchar'='varchar'

    * query:
    """
    select `tinyint` from all_data_types;
    """
    * verify: '$[0].tinyint'=3
    * verify: '$[0].tinyint'>2
    * verify: '$[0].tinyint'<4
    * verify: '$[0].tinyint'>=3
    * verify: '$[0].tinyint'<=3

    * query:
    """
    select `text` from all_data_types;
    """
    * verify: '$[0].text'='text'

    * query:
    """
    select `date` from all_data_types;
    """
    * verify: '$[0].date'=datetime: '2008-10-10' pattern: 'yyyy-MM-dd'
    * verify: '$[0].date'=datetime: '10/10/2008+0800' pattern: 'dd/MM/yyyyZ'

    * query:
    """
    select `smallint` from all_data_types;
    """
    * verify: '$[0].smallint'=30

    * query:
    """
    select `mediumint`, `int` from all_data_types;
    """
    * verify: '$[0].mediumint'=3000000
    * verify: '$[0].int'=3

    * query:
    """
    select `bigint` from all_data_types;
    """
    * verify: '$[0].bigint'=long: 3000000000
    * verify: '$[0].bigint'>long: 2000000000
    * verify: '$[0].bigint'>=long: 3000000000
    * verify: '$[0].bigint'<long: 4000000000

    * query:
    """
    select `float`, `double` from all_data_types;
    """
    * verify: '$[0].float'=float: 10.2
    * verify: '$[0].float'>float: 10.1
    * verify: '$[0].float'>=float: 10.2
    * verify: '$[0].float'<float: 10.3
    * verify: '$[0].float'<=float: 10.2

    * verify: '$[0].double'=double: 10.201802
    * verify: '$[0].double'>double: 10.101802
    * verify: '$[0].double'>=double: 10.201802
    * verify: '$[0].double'<double: 10.301802
    * verify: '$[0].double'<=double: 10.201802