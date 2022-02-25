import pandas as pd
import glob
import os
import keyring
from sqlalchemy import create_engine

list_of_files = glob.glob('downloads/*.csv') # * means all if need specific format then *.csv
latest_file = max(list_of_files, key=os.path.getctime)
checkins = pd.read_csv(latest_file)

engine = create_engine(f"postgresql://ohuxqkeq:{keyring.get_password('ohuxqkeq', 'ohuxqkeq')}@kashin.db.elephantsql.com:5432/ohuxqkeq")

with engine.begin() as con:
    con.execute('delete from untappd')
    checkins.to_sql('untappd', con, if_exists='append', index=False)
