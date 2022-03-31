import React from "react";
import HelpCard from "./HelpCard";

export default function DcHelpWall({ users }) {
  
  const created_at = new Date().toLocaleString();


  return (
    <div className="container">
    <div className="row row-cols-1 row-cols-md-3 g-4">
      {users.map((each) => {
          if (each.hposts.length >= 1) {
        
             return (
              <HelpCard
                key={each.id}
                name={each.first_name}
                image={each.profile_url}
                title={each.hposts.map((c) => c.title)}
                request={each.hposts.map((c) => c.h_request)}
                created_at={created_at}
                phone={each.phone}
                email={each.email}
              />
            );
          }
        })}
      </div>
    </div>
  );
}