# Murder-Mystery-At-SQL-City
Solving a murder mystery through SQL!

## Introduction
This SQL murder mystery is from  [Kaggle](https://www.kaggle.com/datasets/johnp47/sql-murder-mystery-database/data). According to its description, it was created by [Joon Park](https://x.com/JoonParkMusic) and [Cathy He](https://x.com/Cathy_MeiyingHe) while they were Knight Lab fellows. Thanks for the fun puzzle :)

Some relevant links:

Website link - http://mystery.knightlab.com/

Github Repository - https://github.com/NUKnightLab/sql-mysteries

Schema - https://github.com/NUKnightLab/sql-mysteries/blob/master/schema.png


Credits
```
The SQL Murder Mystery was created by Joon Park and Cathy He while they were Knight Lab fellows. See the GitHub repository for more information.
Adapted and produced for the web by Joe Germuska.
This mystery was inspired by a crime in the neighboring Terminal City.
Web-based SQL is made possible by SQL.js
SQL query custom web components created and released to the public domain by Zi Chong Kao, creator of Select Star SQL.
Detective illustration courtesy of Vectors by Vecteezy
Original code for this project is released under the MIT License
Original text and other content for this project is released under Creative Commons CC BY-SA 4.0
```

## But why?
SQL is one of the most important skills in data analysist+/data science scene and I want to show that I can do it and practice. However, I want it to be fun!

The SQL skills used in this mystery solving project include basic stuffs (SELECT, FROM, ORDER BY, etc.) and some intermediate features (JOIN, Nested query, etc.). If you want to play along, I attached the relevant links where you can download database and solve it yourself. I didn't time it but I definitely used less than 20 minutes. Think you can do it faster ? ;)

## TL;DR

Here's the a [picture](https://github.com/user-attachments/assets/ee33501c-cd25-4107-8648-d5431e18eb34) that show steps taken to solution.

## THERE HAS BEEN A MURDER AT SQL CITY

![crimescene](https://github.com/user-attachments/assets/a4f5edc1-dab6-4257-b5dc-0f3f3ca2fa4a)
Photo by <a href="https://unsplash.com/@nampoh?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Maxim Hopman</a> on <a href="https://unsplash.com/photos/silhouette-of-person-on-window-PEJHULxUHZs?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
      
Yes, there has been a murder at SQL City. The detectives need our help to comb through [databases](https://github.com/NUKnightLab/sql-mysteries/blob/master/schema.png) and find relevant information about the case.


### 1 - Getting crime scene report

A team of professionals was dispatched to the crime scene and collected several statements from witnesses at the scene.

A simple query that filters crime scene reports based on date, location, and type of crime produced showed the following report:
```
"Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr".
The second witness, named Annabel, lives somewhere on "Franklin Ave" "
```


### 2 - Reading witnesses' interviews

Following that trail, we got the following statement from the witnesses:

Witness 1 - Morty Schapiro:

<img width="685" height="78" alt="witness1" src="https://github.com/user-attachments/assets/d27df2ce-484d-4abd-afd8-39f64f27e289" />

```
"I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag
started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W"."
```

Witness 2 - Annabel Miller:

<img width="687" height="72" alt="witness2" src="https://github.com/user-attachments/assets/0d6b95d2-905e-48c6-af2b-ea535a994506" />

```
"I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th."
```


### 3 - Checking clues

Let's first see who was in the "Get Fit Now" gym on 9th January and fit the membership number and status.

<img width="897" height="116" alt="list of sus1" src="https://github.com/user-attachments/assets/cf0265f8-80f8-433c-bf39-17d288b4b514" />

Now let's check the driver_license to see whose car fit the number plate description.

<img width="481" height="133" alt="list of sus2" src="https://github.com/user-attachments/assets/0900e79e-8d11-41fd-8ecd-989f687db5b0" />

### 4 - Checking answer

Ahha! There is only 1 name that appear in both list. This has to be our perp! Now we let eye-witness, Annabel Miller, see our suspect's picture to verify.  

```
-- Showing picture to witness 
INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT value FROM solution;
```
```
Result: *"Congrats, you found the murderer!..."
```

![cuffing](https://github.com/user-attachments/assets/13c42bef-8067-4689-8fb5-a7d45b64fcaf)
Photo by [Kindel Media](https://www.pexels.com/photo/a-man-in-black-shirt-arrested-7785088/)

Hurray! We found the killer with SQL!

## ...But wait, there's more...

```
...But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer
to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final
step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.
```

### Interview with the killer

![interviewing killer](https://github.com/user-attachments/assets/60bfd872-1937-47e0-8db2-fbdeaffbb369)
Photo by [Kindel Media](https://www.pexels.com/photo/an-officer-talking-to-a-man-7785067/)

After catching the perp, interview with him revealed that there is a MASTERMIND behind and he was just a hired gun (he's smiling because the police promised him some candies later for the snitch :) ).

The interview with the killer provided the following statements:
```
I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has
red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.
```

### Checking databases

Let's cross check with the database to see who fit all the boxes. These include:
```
(1) female
(2) height (65" -> 67")
(3) red hair
(4) drives Tesla, Model S
(5) been to SQL Symphony Concert 3 times during 12/2017
```

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

![cool pineapple](https://github.com/user-attachments/assets/876c9497-2b4b-43a2-9cca-811ebab51c9a)

Photo by [Pineapple Supply Co.](https://www.pexels.com/photo/close-up-photo-of-pineapple-with-party-hat-and-a-black-sunglasses-1071878/)

The murder mystery at SQL City has been solved! 



