import React from "react";
import GratitudeCard from "./GratitudeCard";

export default function GratitudeWall({ users, patchGrat }) {
  return (
    <>
      {users.map((each) => {
         console.log(each)
          return (
            <GratitudeCard
              key={each.id}
              name={each.first_name}
              image={each.profile_url}
              // comment={each.gposts.map((c) => c.comment)}
              // likes={each.gposts.map((c) => c.likes)}
              // gid={each.gposts.map((id) => id.id)}
              // patchGrat={patchGrat}
            />
          );
        }
      )}
    </>
  );
}
