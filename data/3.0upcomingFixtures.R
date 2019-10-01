upcomingFixtures <- jsonlite::fromJSON("https://fantasy.premierleague.com/api/fixtures") %>% 
  filter(started  == FALSE)

upcomingFixtures_home <- upcomingFixtures  %>% 
  left_join(summaryData$teams[,c("id", "name", "strength")], by =c("team_h" = "id")) %>%
  select(name, strength, event) %>% 
  rename(HomeTeam = name, HomeTeamStrength = strength)
  
upcomingFixtures_away <- upcomingFixtures  %>% 
  left_join(summaryData$teams[,c("id", "name", "strength")], by =c("team_a" = "id")) %>%
  select(name, strength, event) %>% 
  rename(AwayTeam = name, AwayTeamStrength = strength)  

upcomingFixturesTmp <- bind_cols(upcomingFixtures_home, upcomingFixtures_away) %>%
  mutate(HomeTeamStrength = as.numeric(HomeTeamStrength),
         AwayTeamStrength = as.numeric(AwayTeamStrength))


upcomingFixtures_home <- upcomingFixturesTmp %>% 
  select(HomeTeam, AwayTeamStrength, event) %>% 
  rename(Team = HomeTeam, Difficulty = AwayTeamStrength)

upcomingFixtures_away <- upcomingFixturesTmp %>% 
  select(AwayTeam, HomeTeamStrength, event) %>% 
  rename(Team = AwayTeam, Difficulty = HomeTeamStrength) 

upcomingFixturesTmp <- bind_rows(upcomingFixtures_home, upcomingFixtures_away) %>% 
  arrange_at(c("Team", "event")) %>%
  mutate(Team = factor(Team),
         event = as.character(event),
         Lag = lag(event, default = upcomingFixturesTmp[1,"event"]),
         Lag = case_when(Lag == event ~ paste(event, "Double"),
                   TRUE ~ Lag),
         event = Lag)

upcomingFixtures <- upcomingFixturesTmp

rm(upcomingFixtures_away, upcomingFixtures_home, upcomingFixturesTmp)