# Select the everything enclosed between the two expressions (?<=<insertopening character).*(?=<insert closing character>)
grep -oP '(?<=export BW_SESSION=").*(?=")')

