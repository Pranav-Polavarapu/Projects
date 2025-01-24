import streamlit as st
import pandas as pd
from sqlalchemy import create_engine

# Define the database connection URI
db_uri = "postgresql+psycopg2://pranav:pranav@localhost:5432/Cinematic-Insight"
engine = create_engine(db_uri)

def run_query(query):
    """Executes a SQL query and returns the results as a DataFrame."""
    with engine.connect() as connection:
        return pd.read_sql(query, connection)

# Creating a sidebar for navigation between pages
st.sidebar.title('Navigation')
page = st.sidebar.radio('Select a page:', ['Query Runner', 'ER Diagram & Data Preview'])

if page == 'Query Runner':
    # Streamlit app content for Query Runner
    st.title("Cinematic Insight Odyssey Database")
    st.markdown("Developed by Pranav Polavarapu | Sai Keerthi Chelluri | Nikhil Raj Yammani")
    st.markdown("You can find the schema ER diagram on the second page.")
    
    # Input box for user-defined SQL query
    user_query = st.text_area("Enter your SQL query here:", "")
    
    # Button to execute the query
    if st.button("Run Query"):
        if user_query.strip():  # Check if the user has entered a query
            try:
                # Run and display the user-defined query
                result_df = run_query(user_query)
                st.write(result_df)
            except Exception as e:
                st.error(f"An error occurred: {e}")
        else:
            st.error("Please enter a valid SQL query.")

elif page == 'ER Diagram & Data Preview':
    st.title("ER Diagram & Data Tables")
    
    # Display ER Diagram
    st.image("/Users/pranavpolavarapu/Desktop/SUNY UB 🎓/Sem 2/DMQL - CSE 560/Team Project/Insight-Illuminati_ProjectMilestone2./ER Diagram.png", caption='ER Diagram of the Cinematic Insight Database')
    
    # Dropdown to select table and display data
    table_name = st.selectbox("Select a table to view the top 20 rows:",
                              ('movies', 'genre', 'moviegenres', 'people', 'occupations',
                               'castandcrew', 'alternatetitles', 'titlecrew', 'episodes',
                               'filmroles', 'rating'))
    if st.button("Show Data"):
        query = f"SELECT * FROM {table_name} LIMIT 20"
        result_df = run_query(query)
        st.write(result_df)
