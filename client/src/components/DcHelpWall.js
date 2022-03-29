import React from "react";
import HelpCard from "./HelpCard";

export default function DcHelpWall({ users }) {
  
  //console.log(users)


  return (
    <div className="container">
      <div className="row row-cols-1 row-cols-md-3 g-4">
      
          {users && users.map((each) => {
            return (
              <HelpCard
                key={each.id}
                name={each.first_name}
                image={each.profile_url}
                request={each.request}
                created_at={each.created_at}
                phone={each.phone}
                email={each.email}
                />
            )
          }
          )}
              
          
          
          
      </div>
    </div>
  );
}
