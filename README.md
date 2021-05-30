# complingproject
The bestest computational linguistics project ever. 

Needlessly Gendered Portrayal of Traffic Accidents in Turkish Mass Media: A sentiment analysis project

DEFINITION OF THE TASK

Based on the unnecessarily emphasized gender and the harsh language used for female drivers in the Turkish media, we have planned to make a sentiment analysis project determining the positive/negative language against women drivers. Within the scope of the project, we will use the data of Turkish media reports about female and male drivers and create a sentiment analysis determining the language difference for male and female drivers; positivity or negativity ratio of the reports / overwhelming emotion (happiness, anger, pity etc.) differing depending on the gender.


DATASET

We have a preliminary dataset from Google News, we also added Büşra's dataset of news already prepared with links and texts(from 93 to 205 in the excel data). The text part looks a bit messy because of unnecessary tags and some websites do not allow us to extract the text bodies, we plan to limit the news' websites and work only with the ones that we can extract the clear text. We aim to expand our dataset.


FRAMEWORK

For the preprocessing of the data we used RegEx. We aim to use Naive Bayes or Logistic Regression and Sentiment Analysis for modelling and analysis in
the process. We will use SentiTurkNet (http://research.sabanciuniv.edu/29556/1/2-sentiturknet-2015.pdf) as our polarity lexicon. 


EVALUATION METHOD

Since we have a relatively small dataset, we will use:
The dataset which is made of Büşra’s initial data and the news articles we scraped from the web as the train and validation data. 
Then we will extract the news articles from the web pages which didn’t allow us to scrape data. We will manually annotate this data to set the gold standard. Then we will use it as the test data to see the performance of our classifier. 
We will examine precision, recall and accuracy.
