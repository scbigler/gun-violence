
  --Remove lowercase 'town' at end of each town in name column
  update subest2021 
   set name = replace(name, 'town', '');
  
  --Remove lowercase 'city' at end of each town in name column
  update subest2021 
   set name = replace(name, 'city', '');
  
  
  -- Replace the substring '(county)' from each county in name column with the string 'County'. 
  update gun_violence
   set city_or_county = replace(city_or_county, '(county)', 'County');
   
   
   --Join gunviolencedata table with subest2021 table to update empty 'population' column in gunviolencedata.
   UPDATE gunviolencedata
   SET population = estimatebase2020
   FROM subest2021
   WHERE gunviolencedata.state = subest2021.stname AND
   gunviolencedata.city_or_county = subest2021.name; 
   

  --This query not needed
  SELECT * FROM subest2021 
  WHERE name ~ '(city|/)$';

   
   
   