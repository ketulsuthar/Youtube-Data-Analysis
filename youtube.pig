-- Top 5 Category

-- Load data
youtubes = LOAD 'youtube.txt' USING PigStorage('\t') as (video_id:chararray,uploader:chararray,interval:int,category:chararray,length:int,numofviews:int,rating:double,numofratting:int,numofcomments:int,relid:chararray);
--describe youtubes;

categorieswisedata = FOREACH youtubes GENERATE $3, 1;
--DUMP categorieswisedata;

-- Group By Category
groupbycat = GROUP categorieswisedata BY $0;
--DUMP groupbycat;

-- Count Category data
groupbycount = FOREACH groupbycat GENERATE group, COUNT($1);
--DUMP groupbycount;

-- OrderBy data Descending Order
orderbycount = ORDER groupbycount BY $1 DESC;

-- Fetch top Five data
top5cat = LIMIT orderbycount 5;
--DUMP top5cat;

-- Store Result into file
STORE top5cat INTO 'Top5Category' using PigStorage('->')

