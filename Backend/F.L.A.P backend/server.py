from flask import Flask, jsonify
import Getting_data as d
# from flask_jsonify import jsonify
app = Flask(__name__)

# print(d.gk_df)
# print(d.gk_df.to_json())
fwd_data = d.att_df.to_json(orient="index")
# fwd_json_data = jsonify(fwd_data)
# print(fwd_json_data)
@app.route('/gk')
def gk():
    return d.gk_df.to_json()

@app.route('/def')
def defender():
    return d.def_df.to_json()

@app.route('/mid')
def mid():
    print(type(d.gk_df.json()))
    return d.mid_df.to_json()

@app.route('/fwd')
def fwd():
    return d.att_df.to_json()

if __name__ == "__main__":
    app.run(debug=True)