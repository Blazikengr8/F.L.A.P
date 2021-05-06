import requests
import pandas as pd
import numpy as np



class Player:
    def __init__(self, id, name, pos, points_per_game, transfers_in, selected_by, team_code, transfers_out, goals, assists, clean_sheets, ict_index, chance_of_playing, minutes, form, score):
        self.name = name
        self.pos = pos
        self.id = id
        self.points_per_game = points_per_game
        self.transfers_in = transfers_in
        self.transfers_out = transfers_out
        self.selected_by = selected_by
        self.team_code = team_code
        self.goals = goals
        self.assists = assists
        self.clean_sheets = clean_sheets
        self.ict_index = ict_index
        self.chance_of_playing = chance_of_playing
        self.minutes = minutes
        self.score = score
        self.form = form

    def cal_score(self):
        self.score = self.score+1
        #calculate score to be sorted by\


url = 'https://fantasy.premierleague.com/api/bootstrap-static/'
r = requests.get(url)
json = r.json()
json.keys()
# print(json.keys())
events_df = pd.DataFrame(json['events'])
# print(events_df.columns)

elements_df = pd.DataFrame(json['elements'])
elements_types_df = pd.DataFrame(json['element_types'])
teams_df = pd.DataFrame(json['teams'])
# print(teams_df.columns)

# print(elements_df.head()) top 5 rows

# slim_elements_df = elements_df[['second_name','team','element_type','selected_by_percent','now_cost','minutes','transfers_in','value_season','total_points']]
slim_elements_df = elements_df[['id', 'second_name', 'element_type', 'points_per_game', 'transfers_in', 'selected_by_percent', 'team_code', 'transfers_out', 'goals_scored', 'assists', 'clean_sheets', 'ict_index', 'chance_of_playing_this_round', 'minutes', 'form', 'saves']]
sorted_by_form_elements_df = slim_elements_df.sort_values('form', ascending=False).head(20)
# sorted_by_ict_elements_df = slim_elements_df.sort_values('ict_index', ascending=False).head(20)
# sorted_by_points_per_game_elements_df = slim_elements_df.sort_values('points_per_game', ascending=False).head(20)
# sorted_by_minutes_elements_df = slim_elements_df.sort_values('minutes', ascending=False).head(20)
# sorted_by_transfer_in_elements_df = slim_elements_df.sort_values('transfers_in', ascending=False).head(20)
# # print(slim_elements_df.sort_values('form', ascending=False).head(20))
# sorted_by_form_elements_df.to_excel('E:/F.L.A.P backend/form_data.xlsx')
# sorted_by_transfer_in_elements_df.to_excel('E:/F.L.A.P backend/transfers_in_data.xlsx')
# sorted_by_minutes_elements_df.to_excel('E:/F.L.A.P backend/minutes_data.xlsx')
# sorted_by_ict_elements_df.to_excel('E:/F.L.A.P backend/ict_data.xlsx')
# sorted_by_points_per_game_elements_df.to_excel('E:/F.L.A.P backend/points_data.xlsx')

def sorting(df):
    df = df.sort_values('form', ascending=False)
    return df

gk_df = slim_elements_df.loc[slim_elements_df.element_type == 1]
# print(gk_df.loc[7])
# sorted_gk_df = gk_df.sort_values(['chance_of_playing_this_round', 'form', 'clean_sheets', 'transfers_in', 'saves'], ascending=[False, False, False, False, True])
# print(sorted_gk_df)
mid_df = slim_elements_df.loc[slim_elements_df.element_type == 3]
def_df = slim_elements_df.loc[slim_elements_df.element_type == 2]
att_df = slim_elements_df.loc[slim_elements_df.element_type == 4]

gk_df = sorting(gk_df)
# print(gk_df)
def_df = sorting(def_df)
mid_df = sorting(mid_df)
att_df = sorting(att_df)

final_df = gk_df.head(2)
final_df = final_df.append(def_df.head(5))
final_df = final_df.append(mid_df.head(5))
final_df = final_df.append(att_df.head(3))
print(final_df)



#
# print(gk_df)
# print(def_df)
# print(mid_df)
# print((att_df))

# print(gk_df.to_json())

#
# print(att_df.loc[5])
# sorted_att_df = att_df.sort_values(['form', 'points_per_game', 'selected_by_percent', 'transfers_in', 'goals_scored', 'assists', 'ict_index', 'clean_sheets'], ascending=[False, False, False, False, False, False, False, False])
# print(sorted_att_df)
# print(sorted_att_df.loc[551])
# print(sorted_att_df.loc[119])



# print(slim_elements_df.loc[slim_elements_df.element_type == 2])