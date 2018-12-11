# SIG Service Catalog
  - Introduce yourself
    * Carolyn Van Slyck
    * Senior Software Engineer at Microsoft
    * SIG Chair - My job is to make the project successful, ensure everyone is
      able to participate.
  - Explain what a SIG is
  - Lay out my goals for this intro
    * Answer your questions
    * Demo Service Catalog to people who haven't seen it before
    * Invite you to participate in Service Catalog and highlight opportunities

## Why are we here?
  - Q. Please raise your hand if you are in a SIG already?
  - Q. Who is window shopping for a place to join in and contribute to Kubernetes?
  - Q. Who is from another SIG and is looking to get an update on what is going on with
       SIG Service Catalog?

## What is Service Catalog?
  - OSB API
  - Provision cloud services
  - Clouds with Brokers: Microsoft, Google, Amazon, IBM and more.
    * Check out OSBKit for our list of brokers.
  - Q. Who has used Service Catalog before?
  - Q. Who has used a broker with Cloud Foundry before?
  - Quick thought experiment of what it is like to provision entirely from k8s, and manage from k8s. vs provisioning pieces from the cloud portal or a cli.
  - This is a not a unique problem and we aren't the only solution. Service Catalog
  essentially is taking advantage of all the existing brokers that were made for
  Cloud Foundry and made it so that we could use those directly in our clusters.

## Demo
  - Show you the best broker, if you are going to try this out at home later. Best = Free
    MINIBROKER!
  - Wordpress + MySQL demo
    * Highlight that you can use manifests + kubectl, or you can use svcat.
    * IMO svcat is nice because it's less typing so it's great for developing
      service catalog, and playing with it to explore. In production, you would
      want to use manifests so that you can check in your infra's code.
  - Show the marketplace command against OSBA to give a feel for what type of things
    you can do.

## Upcoming Opportunities
  - So that's what you can do today with Service Catalog. If you are interested in
    more use cases and features, come to our Deep Dive!
  - Need core contributors and reviewers. Offering mentoring for new contributors,
    and a ladder up to becoming a SIG Chair.
  - Evaluating if we can move to CRDs. Looking for someone, ideally a group of people,
    who want to learn a ton about CRDs and try to do the migration.
  - Collaborating with SIG Apps on making an amazing developer experience ON TOP
    of Service Catalog.
    * There's more to the ecosystem than brokers: Amazon's operator, CNAB bundles.
    * Kubernetes Native Developer Experience!
    * User Experience improvements: defaulting, customization, assistance selecting from
      a large selection of services and their service levels.
    * Hooking up to existing services, sharing services.
