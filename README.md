# complingproject
The bestest computational linguistics project ever. 

Needlessly Gendered Portrayal of Traffic Accidents in Turkish Mass Media: A sentiment analysis project

DEFINITION OF THE TASK

Based on the unnecessarily emphasized gender and the harsh language used for female drivers in the Turkish media, we have planned to make a sentiment analysis project determining the positive/negative language against women drivers. Within the scope of the project, we will use the data of Turkish media reports about female and male drivers and create a sentiment analysis determining the language difference for male and female drivers; positivity or negativity ratio of the reports / overwhelming emotion (happiness, anger, pity etc.) differing depending on the gender.


DATASET

We have a preliminary dataset from Google News, we also added Büşra's dataset of news already prepared with links and texts(from 93 to 205 in the excel data). The text part looks a bit messy because of unnecessary tags and some websites do not allow us to extract the text bodies, we plan to limit the news' websites and work only with the ones that we can extract the clear text. We aim to expand our dataset.


FRAMEWORK

For the preprocessing of the data we used RegEx. We aim to use Naive Bayes or Logistic Regression and Sentiment Analysis for modelling and analysis in
the process. We will use _Turkish-tr-NRC-VAD-Lexicon.txt_ (reference will be provided soon) as our Sentiment lexicon. 


EVALUATION METHOD

Since we have a relatively small dataset, we will use:
The dataset which is made of Büşra’s initial data and the news articles we scraped from the web as the train and validation data. 
Then we will extract the news articles from the web pages which didn’t allow us to scrape data. We will manually annotate this data to set the gold standard. Then we will use it as the test data to see the performance of our classifier. 
We will examine precision, recall and accuracy.


WHAT WE NEED TO DO FURTHER is to find the matching lexical items in our lexicon for all words (including the morphologically complex ones) in our data.

Then, we will move on to randomly separate our data so that we have different data sets for both training and testing phases.

(we are confused if we should train the classifier based on sentiment values, i.e. the relevant features, and the categories (biased vs. neutral) that we provide it as part of the training OR do a logistic regression or some sort of a linear model to understand the effect of Sentiment values on determining the category of the article. We will need to talk about it and decide on it as soon as possible.)

We will find sentiment values for the tokens in the training set that have a match in the lexicon and save them in a data frame.

Later, we will analyze if sentiment values of gender-biased news articles differ in any dimension from the values of gender-neutral ones. Our prediction is that they will be different at least in one dimension. We will build a classifer to test this hypothesis and try to classify the articles in the test data based on sentiment values. Since we will have already categorized these two different news article types before the analysis, we will be able to measure the accuracy/precision of the classifier.
