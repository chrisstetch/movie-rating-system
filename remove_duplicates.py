import pandas
import sys

def removeDuplicate(fname):
    """
    Removes duplicate entries in a csv file.

    Parameters:
    -----------
    fname (str): Input file (must be csv extension).

    Returns
    --------
    New csv file not containing duplicate entries.

    Description
    -----------
    Using the pandas library this function will scan through each
    column in a provided csv file. If there is a duplicated
    entry found in the columns then that entire row is deleted
    to ensure each column only contains unique values.

    """
    if fname.lower().endswith('.csv'):
        pass
    else:
        raise TypeError('Error: File type must be .csv')
    
    inFile = pandas.read_csv(fname)
    exists = {} #mark each seen entry in the columns
    
    #Iterate the columns
    for col in inFile.columns:
        exists[col] = set()
        delete_rows = [] #Add all the rows that will be deleted here

        #Iterate the rows
        for i, entry in inFile[col].items():
            if entry in exists[col]:
                delete_rows.append(i)
            else:
                exists[col].add(entry)
        inFile = inFile.drop(delete_rows)
    
    #Create a new csv file without the duplicates
    inFile.to_csv('duplicate_free.csv', index=False)
    

if __name__ == '__main__':
    removeDuplicate(sys.argv[1])