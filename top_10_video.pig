-- Top 10 Rated Videos

-- Load Data
videos = LOAD 'youtube.txt' USING PigStorage('/t') as (video_id:chararray,uploader:chararray,interval:int,category:chararray,length:int,numofviews:int,rating:double,numofratting:int,numofcomments:int,relid:chararray);

-- Get Id, Name , Category and Rating
videosdata = FOREACH video GENERATE $0,$1,$3,$7;

-- Sort video in descending order by rating
orderbyrating = ORDER videosdata BY $3 DESC;

-- Top 10 videos by rating
top10video = LIMIT orderbyrating 10;

--DUMP top10video;

-- Store Result into file
STORE top1pvideo INTO 'Top10RatedVideo' using PigStorage(',');


