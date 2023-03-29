import "./HomeFeedPage.css";
import React from "react";

// aws amplify
import { Auth } from "aws-amplify";

import DesktopNavigation from "../components/DesktopNavigation";
import DesktopSidebar from "../components/DesktopSidebar";
import ActivityFeed from "../components/ActivityFeed";
import ActivityForm from "../components/ActivityForm";
import ReplyForm from "../components/ReplyForm";
import checkAuth from '../lib/CheckAuth'



// --------Honeycomb OTEL------------
// import { trace } from "@opentelemetry/api";

// import { XMLHttpRequestInstrumentation } from "@opentelemetry/instrumentation-xml-http-request";
// import { FetchInstrumentation } from "@opentelemetry/instrumentation-fetch";
// import { registerInstrumentations } from "@opentelemetry/instrumentation";

// import { DocumentLoadInstrumentation } from "@opentelemetry/instrumentation-document-load";
// import { UserInteractionInstrumentation } from "@opentelemetry/instrumentation-user-interaction";

// const tracer = trace.getTracer();

//---------------------------

export default function HomeFeedPage() {
  const [activities, setActivities] = React.useState([]);
  const [popped, setPopped] = React.useState(false);
  const [poppedReply, setPoppedReply] = React.useState(false);
  const [replyActivity, setReplyActivity] = React.useState({});
  const [user, setUser] = React.useState(null);
  const dataFetchedRef = React.useRef(false);

  //-----Honeycomb--------

  // const rootSpan = tracer.startActiveSpan("document_load", (span) => {
  //   span.setAttribute("pageUrlwindow", window.location.href);
  //   window.onload = (event) => {
  //     span.end(); //once page is loaded, end the span
  //   };
  // });

  // registerInstrumentations({
  //   instrumentations: [
  //     new XMLHttpRequestInstrumentation({
  //       propagateTraceHeaderCorsUrls: [
  //         /.+/g,
  //         /^http:\/\/localhost:4567\/.*$/,
  //         `${process.env.REACT_APP_BACKEND_URL}`,
  //       ],
  //     }),
  //     new FetchInstrumentation({
  //       propagateTraceHeaderCorsUrls: [
  //         /.+/g,
  //         /^http:\/\/localhost:4567\/.*$/,
  //         `${process.env.REACT_APP_BACKEND_URL}`,
  //       ],
  //     }),
  //     // new DocumentLoadInstrumentation(),
  //     // new UserInteractionInstrumentation(),
  //   ],
  // });

  //--------------------

  const getIdToken = async () => {

    Auth.currentSession().then(res => {
      let accessToken = res.getAccessToken()

      localStorage.setItem(
        "access_token",
        accessToken.jwtToken
      );

      loadData();
      checkAuth(setUser);

    })
      .catch((err) => console.log(err));
  }

  const loadData = async () => {
    try {
      // const backend_url = `http://localhost:8000/api/activities/home`; // for envoy-proxy
      const backend_url = `${process.env.REACT_APP_BACKEND_URL}/api/activities/home`;
      const res = await fetch(backend_url, {
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem("access_token")}`,
        },
        method: "GET",
      });
      let resJson = await res.json();
      if (res.status === 200) {
        setActivities(resJson);
      } else {
        console.log(res);
      }
    } catch (err) {
      console.log(err);
    }
  };

  // ------ BEGIN  Of Cognito Code-------
  // check if we are authenicated


  // ------ END Of Cognito Code-------

  React.useEffect(() => {
    //prevents double call
    if (dataFetchedRef.current) return;
    dataFetchedRef.current = true;
    getIdToken();

  }, []);

  return (
    <article>
      <DesktopNavigation user={user} active={"home"} setPopped={setPopped} />
      <div className="content">
        <ActivityForm
          user_handle={user}
          popped={popped}
          setPopped={setPopped}
          setActivities={setActivities}
        />
        <ReplyForm
          activity={replyActivity}
          popped={poppedReply}
          setPopped={setPoppedReply}
          setActivities={setActivities}
          activities={activities}
        />
        <ActivityFeed
          title="Home"
          setReplyActivity={setReplyActivity}
          setPopped={setPoppedReply}
          activities={activities}
        />
      </div>
      <DesktopSidebar user={user} />
    </article>
  );
}