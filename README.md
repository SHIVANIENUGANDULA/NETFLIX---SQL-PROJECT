# 📺 Netflix Data Exploration with SQL
![Netflix Logo](logo.png)
Welcome! This project dives into Netflix's catalog of movies and TV shows using SQL. I worked with a real dataset to answer a set of business-relevant questions and uncover patterns in content types, genres, countries, and release trends. It’s a practical demonstration of how SQL can be used for data storytelling.

---

## 🔍 What This Project Covers

- Breakdown of content types (Movies vs TV Shows)
- Most frequent content ratings and durations
- Trends by release year and country of origin
- Genre frequency and actor appearances
- Keyword-based sentiment tagging (e.g., violence, kill)

---

## 🗂 Dataset Info

The dataset was sourced from [Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download). It includes details such as:
- Title, type, cast, director
- Country and release year
- Duration and genre tags
- Content descriptions

---

## 🛠 Schema Setup

Here's a preview of the table structure I used:

```sql
CREATE TABLE netflix (
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```

---

## 🧠 Sample Questions Answered

Some of the key questions I answered using SQL include:

- How many movies vs TV shows are in the catalog?
- Which ratings appear most often?
- What are the top 5 content-producing countries?
- What’s the longest movie on the platform?
- How many shows were added in the past 5 years?
- Which actors appear most often in Indian content?
- Are there shows that mention violence or killing in their descriptions?

All SQL queries are included in the project files under `BUSINESS PROBLEMS` and solutions for the problems in `Solutions_of_business_problems.sql`.

---

## 💡 What I Learned

This project helped sharpen my ability to:
- Work with messy or multi-value columns using functions like `STRING_TO_ARRAY` and `UNNEST`
- Handle date-based filtering with `TO_DATE()` and intervals
- Extract meaningful insights through subqueries and window functions
- Build reusable SQL templates for exploratory analysis

---

## 📂 Files in This Repo

- `netflix_titles.csv`: Raw dataset
- `Schemas.sql`: Table creation script
- `BUSINESS PROBLEMS`: Some real life Business problems
- `Solutions_of_business_problems.sql`: Business problem solutions
- `README.md`: You're reading it 🙂

---

## 🙋‍♀️ About Me

Hi, I’m Shivani – a data analyst passionate about turning numbers into actionable stories. I built this project to deepen my SQL skills and showcase how even simple queries can unlock meaningful insights from entertainment data.

Feel free to connect with me on [LinkedIn](www.linkedin.com/in/shivanienugandula)

---
