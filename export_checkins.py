import pandas as pd
import glob
import os
import keyring
from datetime import datetime
from sqlalchemy import create_engine

print('reading csv...')
list_of_files = glob.glob('downloads/*.csv') # * means all if need specific format then *.csv
latest_file = max(list_of_files, key=os.path.getctime)
checkins = pd.read_csv(latest_file)

print('uploading file...')
engine = create_engine(f"postgresql://ohuxqkeq:{keyring.get_password('ohuxqkeq', 'ohuxqkeq')}@kashin.db.elephantsql.com:5432/ohuxqkeq")

with engine.begin() as con:
    con.execute('delete from untappd')
    checkins.to_sql('untappd', con, if_exists='append', index=False)

print('exporting untappd_venue...')
d = datetime.now().strftime('%Y%m%d')
df = pd.read_sql('select * from public.untappd_venue', engine)
df.to_csv(f'exports/untappd_venue_{d}.csv', index=False)
