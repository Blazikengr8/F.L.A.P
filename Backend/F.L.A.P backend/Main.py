# -*- coding: utf-8 -*-
"""
Created on Mon Feb 15 13:36:09 2021

@author: Advaith
"""

import requests
import pandas as pd
import numpy as np
from flask import Flask

url = 'https://fantasy.premierleague.com/api/bootstrap-static/'
app = Flask(__name__)

r = requests.get(url)

json = r.json()
json.keys()
# print(json.keys())

# def create_excel():
#     slim_elements_df.to_excel('output.xlsx',sheet_name='Sheet1', na_rep='')
    
elements_df = pd.DataFrame(json['elements'])
elements_types_df = pd.DataFrame(json['element_types'])
teams_df = pd.DataFrame(json['teams'])

# print(elements_df.head())
print(elements_df.columns)

slim_elements_df = elements_df[['chance_of_playing_next_round', 'chance_of_playing_this_round', 'code',
       'cost_change_event', 'cost_change_event_fall', 'cost_change_start',
       'cost_change_start_fall', 'dreamteam_count', 'element_type', 'ep_next',
       'ep_this', 'event_points', 'first_name', 'form', 'id', 'in_dreamteam',
       'news', 'news_added', 'now_cost', 'photo', 'points_per_game',
       'second_name', 'selected_by_percent', 'special', 'squad_number',
       'status', 'team', 'team_code', 'total_points', 'transfers_in',
       'transfers_in_event', 'transfers_out', 'transfers_out_event',
       'value_form', 'value_season', 'web_name', 'minutes', 'goals_scored',
       'assists', 'clean_sheets', 'goals_conceded', 'own_goals',
       'penalties_saved', 'penalties_missed', 'yellow_cards', 'red_cards',
       'saves', 'bonus', 'bps', 'influence', 'creativity', 'threat',
       'ict_index', 'influence_rank', 'influence_rank_type', 'creativity_rank',
       'creativity_rank_type', 'threat_rank', 'threat_rank_type',
       'ict_index_rank', 'ict_index_rank_type',
       'corners_and_indirect_freekicks_order',
       'corners_and_indirect_freekicks_text', 'direct_freekicks_order',
       'direct_freekicks_text', 'penalties_order', 'penalties_text']]

# print(slim_elements_df)
slim_elements_df.to_excel('outputall.xlsx',sheet_name='Sheet1', na_rep='')

#slim_elements_df['position'] = slim_elements_df().element_type.map(elements_types_df.set_index('id').singular_name)

# slim_elements_df['position'] = slim_elements_df.element_type.map(elements_types_df.set_index('id').singular_name)
#
# # print(slim_elements_df)
#
# slim_elements_df['team'] = slim_elements_df.team.map(teams_df.set_index('id').name)
#
# # print(slim_elements_df)
#
# slim_elements_df['value'] = slim_elements_df.value_season.astype(float)
#
# print(slim_elements_df.sort_values('value',ascending = False).head(10))

# print(slim_elements_df)

# @app.route('/', methods=["GET", "POST"])
# def home():
#     return slim_elements_df.to_json()

# if __name__ == "__main__":
#     app.run()
