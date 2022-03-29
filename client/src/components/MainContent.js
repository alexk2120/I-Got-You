import React from "react";
import GratitudeWall from "./GratitudeWall";
import { Routes, Route } from "react-router-dom";
import DcHelpWall from "./DcHelpWall";
import { useEffect, useState } from "react";
import HelpForm from "./HelpForm";
import GratForm from "./GratForm";

export default function MainContent() {
  const [users, setUsers] = useState([]);
   const [help, setHelp] = useState([]);
   const [grat, setGrat] = useState([]);
   const [gratData, setGratData] = useState([]);

  useEffect(() => {
    fetch("/users")
   .then((r) => r.json())
   .then((users) =>  setUsers(users)); 
      
  // fetch("/hposts")
  // .then((r) => r.json())
  // .then((help) => console.log('hposts',help),  setHelp(help));


  // fetch("/gposts")
  //  .then((r) => r.json())
  // .then((gratData) => console.log("gratposts", gratData) , setGratData(gratData)
   
  }, []);
   
      

  // Creates a User Help Request/Grat
  const postUser = (user) => {
    fetch("/users", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(user),
    })
      .then((res) => res.json())
      .then((newUser) => {
        setUsers([newUser, ...users]);
      });
  };

  const postHelp = (helpD) => {
    fetch("/hposts", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(helpD),
    })
      .then((res) => res.json())
      .then((newhelp) => {
        setHelp([newhelp, ...help]);
      });
  };

  const postGrat = (gratD) => {
    fetch("/gposts", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(gratD),
    })
      .then((res) => res.json())
      .then((newGrat) => {
        setGrat([newGrat, ...grat]);
      });
  };

  //  /patch likes

  const patchGrat = (gratD) => {
    fetch(`/gposts/${gratD.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ ...gratD, likes: gratD.likes }),
    })
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        setGrat(
          gratD.map((p) => {
            if (gratD.id === data.id) {
              return data;
            } else {
              return p;
            }
          })
        );
      });
  };
    return (
    <div>
      <Routes> 
        <Route
          path="/"
          element={
            <GratitudeWall
              users={users}
              gratData={gratData}
              patchGrat={patchGrat}
            />
          }
        /> 
         <Route path="/DC" element={<DcHelpWall users={users} />} />
        <Route
          path="/help-form"
          element={<HelpForm postUser={postUser} postHelp={postHelp} />}
        />
        <Route
          path="/gratitude-form"
          element={<GratForm postUser={postUser} postGrat={postGrat} />}
        />
      </Routes>
    </div>
  );
}
