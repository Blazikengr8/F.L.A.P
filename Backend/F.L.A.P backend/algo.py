import numpy as np
import pandas as pd
import statsmodels.api as sm
import time

teams = pd.read_csv("https://raw.githubusercontent.com/vaastav/Fantasy-Premier-League/master/data/2020-21/teams.csv")
fixtures = pd.read_csv(
    "https://raw.githubusercontent.com/vaastav/Fantasy-Premier-League/master/data/2020-21/fixtures.csv")
players_raw = pd.read_csv(
    "https://raw.githubusercontent.com/vaastav/Fantasy-Premier-League/master/data/2020-21/players_raw.csv")

gws = []
for i in range(1, 30):
    df = pd.read_csv(
        f"https://raw.githubusercontent.com/vaastav/Fantasy-Premier-League/master/data/2020-21/gws/gw{i}.csv")
    # print(i)
    gws.append(df)
    # https: // raw.githubusercontent.com / vaastav / Fantasy - Premier - League / master / data / 2020 - 21 / gws / gw{29.csv
players = pd.concat(gws)
# players.to_excel('E:/F.L.A.P backend/new_players.xlsx')
# print(players)

print(players.columns)

# Removing all the data we don't need
players_filt = players[
    ['name', 'value', 'fixture', 'opponent_team', 'total_points', 'minutes', 'transfers_balance', 'was_home',
     'element']]
fixtures_filt = fixtures[['id', 'team_a', 'team_h']]
teams_filt = teams[['id', 'strength', 'short_name']]
players_raw_filt = players_raw[['id', 'element_type']].astype('int64')

print(players_filt.columns)

# print(players_filt)
# print(fixtures_filt)
# print(teams_filt)
# print(players_raw_filt)

# players_filt['element'] = players_filt['name'].apply(lambda x: x.split("_")[2]).astype('int64')

# Merging position onto our players
merged = players_filt.merge(fixtures_filt, how="left", left_on="fixture", right_on='id')

# Create a row for the player's team
merged['team'] = np.where(merged['opponent_team'] == merged['team_a'], merged['team_h'], merged['team_a'])

# Create a row for player team diificulty
merged = merged.merge(teams_filt, how='left', left_on='team', right_on='id')
merged.rename(columns={
    'strength': 'team_diff',
    'short_name': 'team_short',
}, inplace=True)

# Create a row for opponent team difficulty
merged = merged.merge(teams_filt, how='left', left_on='opponent_team', right_on='id')
merged.rename(columns={
    'strength': 'opp_diff',
    'short_name': 'opp_short'
}, inplace=True)

# Create a row for difficulty difference
merged['diff_diff'] = merged['team_diff'] - merged['opp_diff']
merged.head()

# was_home to int value
merged['is_home'] = merged['was_home'].apply(lambda x: 1 if x else 0)

cleaned = merged.copy(deep=True)  # rather than copying the the whole object it copies the data

# data is prepared

#
cleaned.loc[cleaned['total_points'] < 0, 'total_points'] = 0
cleaned['total_points'] = (cleaned['total_points'] + 1).astype('float32')
cleaned['log_points'] = np.log(cleaned['total_points'])
cleaned = cleaned.drop(cleaned[cleaned.minutes == 0].index)

x = cleaned[['log_points']].astype('float32')
y = pd.DataFrame()
y['team_short'] = cleaned['team_short']
y['opp_short'] = cleaned['opp_short']
y = pd.get_dummies(y, columns=['team_short'])
y = pd.get_dummies(y, columns=['opp_short'])

y = sm.add_constant(y)
model = sm.OLS(x, y).fit()
# print(model.summary())

# x = cleaned[['log_points']].astype('float64')
# # y = cleaned[['value', 'is_home', 'diff_diff', 'element_type', 'minutes']].astype('float64')
# y = cleaned[['value', 'is_home', 'diff_diff', 'minutes']].astype('float64')
# y['team_short'] = cleaned['team_short']
# y['opp_short'] = cleaned['opp_short']
#
# y = pd.get_dummies(y, columns=['is_home'])
# y = pd.get_dummies(y, columns=['team_short'])
# y = pd.get_dummies(y, columns=['opp_short'])
# y = pd.get_dummies(y, columns=['element_type'])

# model = sm.OLS(x, y).fit()
# print(model.summary())

# print(model.aic, mean_squared_error(x, model.predict()))

# Creating model with only players who played 90 minutes

only_90 = cleaned.drop(cleaned[cleaned.minutes != 90].index)
# print(only_90.columns)
x = only_90[['log_points']].astype('float64')
y = only_90[['value', 'is_home', 'diff_diff', 'total_points']].astype('float64')
y['team_short'] = only_90['team_short']
y['opp_short'] = only_90['opp_short']

y = pd.get_dummies(y, columns=['is_home'])
y = pd.get_dummies(y, columns=['team_short'])
y = pd.get_dummies(y, columns=['opp_short'])

model = sm.OLS(x, y).fit()
# print(model.aic, mean_squared_error(x, model.predict()))

df = pd.DataFrame({
    "predicted": model.predict()
})
print(df.sort_values('predicted', ascending=False))

# bins = np.linspace(df.actual.min(), df.actual.max(), 7)
# groups = df.groupby(np.digitize(df.actual, bins))
# print(groups)
# print(groups.mean())
# print()
# print(cleaned.loc[10235])
# x_sorted = df.sort_values('log_points', ascending=False)
# top_20_id = []
# print(x_sorted.head(20))
# x_sorted_top = x_sorted.head(20)


# time.sleep(10)
# print(cleaned.loc[186])
print(cleaned.loc[186])
print(cleaned.loc[526])
# print(cleaned.loc[1493])
# print(cleaned.loc[2896])
# print(cleaned.loc[88])
# print(cleaned.loc[14352])
# print(cleaned.loc[1949])
# print(cleaned.loc[1575])
# print(cleaned.loc[9139])
# print(cleaned.loc[7926])

# print(cleaned.loc['name' == 'Kane'])
# print(y)
