
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