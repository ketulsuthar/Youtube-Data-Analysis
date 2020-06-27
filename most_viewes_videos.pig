
-- Load Data
videos = LOAD 'youtube.txt' USING PigStorage('\t') as (video_id:chararray,uploader:chararray,interval:int,category:chararray,length:int,numofviews:int,rating:double,numofratting:int,numofcomments:int,relid:chararray);
--DESCRIBE videos

-- Get Id, Name, Category, views
videosdata = FOREACH videos GENERATE $0,$1,$3,$5;

filtervideos = FILTER videosdata by $3 > 0;

-- Sort videos in descending order based on most viewed
mostviewed = ORDER filtervideos BY $3 desc;

-- top 20 viewd videos
top20 = LIMIT mostviewed 20;

--Store result into file
STORE top20 INTO 'MostViewd' USING PigStorage(',');






