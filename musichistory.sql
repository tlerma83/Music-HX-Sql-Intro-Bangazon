select *
from Genre;
select * 
from Artist;
select *
from Album;
select *
from Song;

--Query all of the entries in the Genre table
select g.Label, g.GenreId
from Genre g;

--or
select *
from Genre;

--Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist
values(null, "The Rolling Stones", 1963);
--or
insert into Artist(ArtistName, YearEstablished)
values("AC/DC", 1973);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Albumvalues(null, "Exile on Main St", 1971,50, "Rolling Stones",29,2);

--Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song
values(null, "Tumblin",3,1971, 2, 29, 26);

select Title
from Album
where artistId = 1
and Title = "Point of Entry";

select a.ArtistName, al.Title
from Artist a, Album al
where a.ArtistId = al.ArtistId
order by a.ArtistName desc;

--join tables
select s.Titlle, al.Title, a.ArtistName
from Song s
left join Album al
on s.AlbumId = al.AlbumId
left join Artist a
on s.ArtistId = a.ArtistId;

--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
select a.Title, s.Title
from Song s
left join Album a
on s.AlbumId = a.AlbumId;


select s.Title, al.Title, a.ArtistName
from Song s, Album al, Artist a
where s.AlbumId = al.AlbumId
and s.ArtistId = a.ArtistId;


--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence
select al.Title, count(s.AlbumId) as "Number of Tracks"
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.Title;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select a.ArtistName, count(s.SongId) as "number of songs by artist"
from Artist a, Song s
where a.ArtistId = s.ArtistId
group by a.ArtistName;
--COOL, it worked!!!!!!!! 

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select g.Label, count(s.GenreId) as "number of songs in Genre"
from Genre g, Song s
where g.GenreId = s.GenreId
group by g.Label;
--Whooooo!

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select al.Title, max(al.AlbumLength)
from Album al
group by al.Label;

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--Modify the previous query to also display the title of the album.
select s.Title, max(s.SongLength) as "Max Length", al.Title
from Song s, Album al
where s.ArtistId = al.AlbumId
group by s.Title;




