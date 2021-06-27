Loan App
================

## Basic Example App

This projects builds a basic business lending shiny app using
shinyspring. This is a motivating example to get to build your first
shinyspring app

## Context

This app is based on Bankruptcy Data of Several Corporation

#### Step 1:

Step 2 :

-   Wire the Dataset to shinyspring with the following update in
    config.yml

<!-- -->

    # datsets : This is the approach to pre-load datasets
      ds.portfolio.type: rds
      ds.portfolio.connection: data/portfolio.rds

<!-- -->

-   Now run the application to see if dataset portolio is loaded
    correctly. You can check based on

    -   check 1: run steps 2 to Step 5 in `user_script.R`

    -   check 2: When you run the App , you should be able to see the
        the portfolio dataset in your

-   When you run the App , you should be able to see the the portfolio
    dataset in your

    ![](steps/step2/visualizescreen.PNG)
