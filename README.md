# Murder-Mystery-At-SQL-City
Solving a murder mystery through SQL!

## But why?
SQL is one of the most important skills in data analysist+/data science scene and I want to show that I can do it and practice it. However, I want it to be fun!

I have done so many other business-oriented projects and challenges and culmulated a good amount of skills working with SQL. This 'murder mystery' puzzle would be a fun way to demonstate them. In this repo, I will show you step-by-step on how I did 'detective work' through SQL and caught our perp! I will add visuals along the way to keep things interesting :)

## Source
This SQL murder mystery is from  [Kaggle](https://www.kaggle.com/datasets/johnp47/sql-murder-mystery-database/data). According to its description, it was created by [Joon Park](https://x.com/JoonParkMusic) and [Cathy He](https://x.com/Cathy_MeiyingHe) while they were Knight Lab fellows. Thanks for the fun puzzle :)

Without further ado, let's get started with the murder mystery!

## THERE HAS BEEN A MURDER AT SQL CITY
Yes, there has been a murder at SQL City. The detectives need our help to comb through their database and find relevant information about the case. The database schema can be found here(link).

A team of professionals was dispatched to the crime scene and collected several statements from witnesses at the scene. They logged those into SQL's city police database.

A simple query that filters crime scene reports based on date, location, and type of crime produced showed the following report:

*"Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave" "*

Following that trail, we got the following statement from the witnesses:

Witness 1 - Morty Schapiro:

|id|name|license_id|address_number|address_street_name|ssn|
|--|----|----------|--------------|-------------------|----|
|14887|Morty Schapiro|118009|4919|Northwestern Dr|111564949|

Testament: *"I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W"."*


Witness 2 - Annabel Miller:

|id|name|license_id|address_number|address_street_name|ssn|
|--|----|----------|--------------|-------------------|----|
|16371|Annabel Miller|490173|103|Franklin Ave|318771143|

Testament: *"I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th."*

To identify the killer, we will next cross check these clues with the gym " " database to see who fit the descriptions. Fitting various details onto the gym's database we narrowed down the suspect list to 2 individuals

<img width="897" height="116" alt="list of sus1" src="https://github.com/user-attachments/assets/cf0265f8-80f8-433c-bf39-17d288b4b514" />


Next, checking the city driver_license table returned these 3 suspects:

<img width="481" height="133" alt="list of sus2" src="https://github.com/user-attachments/assets/0900e79e-8d11-41fd-8ecd-989f687db5b0" />

Ahha! There is only 1 name that appear in both list. This has to be our perp! Now we let the witness who saw the murderer,Annabel Miller, see our suspect's picture to verify.  

```
-- Showing picture to witness 
INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT value FROM solution;
```
```
Result: *"Congrats, you found the murderer!..."
```

Hurray! We found the killer with SQL! 

## BONUS: The Mastermind

```
...But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer
to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final
step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.
```

After catching the perp, interview with him revealed that there is a MASTERMIND behind and he was just a hired gun. The challenge is to find this individual with less than 2 queries.

The interview with the killer provided the following statements:
```
I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has
red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.
```

Let's cross check with the database to see who fit all the boxes. These include:
(1) female
(2) height (65" -> 67")
(3) red hair
(4) drives Tesla, Model S
(5) been to SQL Symphony Concert 3 times during 12/2017

One semi-complex query later:

<img width="893" height="83" alt="the mastermind" src="https://github.com/user-attachments/assets/c8ac8f69-ff3e-4a5e-8fff-a6d28b667747" />


There is only one person that ticks all the boxes. This must be the person.

```
-- Showing picture to the hired gun
INSERT INTO solution VALUES (1, 'Miranda Priestly');

SELECT value FROM solution;
```
```
result: Congrats, you found the brains behind the murder! Everyone in SQL City hails you as
the greatest SQL detective of all time. Time to break out the champagne!
```
Hurray! We did it with just 1 query.

The murder mystery at SQL City has been solved! 



