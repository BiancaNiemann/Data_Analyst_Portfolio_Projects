--create the campaign table using sql

CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.campaigns`(
    campaign_id INT64 NOT NULL,
    campaign_name STRING NOT NULL,
    start_date DATE,
    end_date DATE,
    campiagn_budget INT64,
    emp_id STRING,
    pmt_id STRING,
    content_id STRING,
    metric_id STRING,
    client_id STRING,
    ad_id STRING
);

--create the clients table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.clients`(
    client_id STRING NOT NULL,
    client_name STRING NOT NULL,
    client_address STRING ,
    client_email STRING ,
    client_phone STRING,
    client_contact_person STRING 
);

--create the employees table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.employees`(
    emp_id STRING NOT NULL,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    emp_address STRING ,
    emp_email STRING ,
    emp_phone STRING,
    supervisor STRING,
    start_date STRING
);

--create the platforms table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.platforms`(
    platform_id STRING NOT NULL,
    platform_name STRING NOT NULL,
    url STRING ,
    platform_contact_person STRING ,
    platform_phone STRING,
    platform_email STRING ,
    ad_id STRING 
);

--create the campaign_platform table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.campaign_platform`(
    campaign_id STRING NOT NULL,
    platform_id STRING NOT NULL
);

--create the influencers table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.influencers`(
    inf_id STRING NOT NULL,
    inf_name STRING NOT NULL,
    social_handle STRING ,
    follower_count INT64,
    infl_phone INT64
);

--create the campaign_influencer table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.campaign_influencer`(
    campaign_id STRING NOT NULL,
    infl_id STRING NOT NULL
);

--create the contents table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.contents`(
    content_id STRING NOT NULL,
    title STRING NOT NULL,
    description STRING,
    media_type STRING ,
    creation_date DATE 
);

--create the payments table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.payments`(
    pmt_id STRING NOT NULL,
    pmt_date DATE,
    amount INT64,
    pmt_type STRING,
    pmt_details STRING 
);

--create the metrics table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.metrics`(
    metric_id STRING NOT NULL,
    impressions INT64,
    clicks INT64,
    engagement INT64,
    conversions INT64
);

--create the advertisment table using sql
CREATE TABLE `snappy-rainfall-450911-k6.market_flash_stage.advertisment`(
    ad_id STRING NOT NULL,
    ad_name STRING NOT NULL,
    ad_type STRING ,
    ad_duration STRING ,
    ad_budget INT64
);
