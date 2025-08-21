# Nxtup Social — Complete Mermaid.js User Flows

Paste this file into any Mermaid-compatible viewer (Mermaid Live, VS Code Mermaid extension, Notion, Obsidian) or render via CI to export SVG/PNG.

---

## 1. Authentication & Onboarding

### 1.1 Login / Sign Up
```mermaid
flowchart TD
  A[App Launch] --> B{Authenticated?}
  B -- No --> C[Login / Sign Up]
  B -- Yes --> Z[Home: Feed]

  C --> D[Sign In]
  C --> E[Sign Up]
  C --> F[Sign in with Google]
  C --> G[Forgot Password?]

  %% Sign In
  D --> D1[Enter Email + Password]
  D1 --> D2{Valid?}
  D2 -- No --> D3[Inline Error: invalid creds]
  D2 -- Yes --> Z

  %% Sign Up (Email)
  E --> E1[Enter Email + Password]
  E1 --> E2{Valid + Unique?}
  E2 -- No --> E3[Inline Error]
  E2 -- Yes --> E4[Create Account]
  E4 --> E5{Email Verification?}
  E5 -- Required --> E6[Open mail → Verify link/code]
  E5 -- Not Required --> H[Onboarding Carousel]
  E6 --> H

  %% Google OAuth
  F --> F1[Google OAuth Prompt]
  F1 --> F2{Approved?}
  F2 -- No/Cancel --> F3[Stay on Auth + Toast]
  F2 -- Yes --> F4[Create/Link Account] --> H

  %% Forgot
  G --> G1[Enter Email]
  G1 --> G2[Send Reset Link]
  G2 --> G3[Open Email → Reset Password]
  G3 --> C
```

### 1.2 Onboarding Carousel - Locality + Interests
```mermaid
flowchart TD
  H[Onboarding Carousel] --> H1[Screen 1: Discover Your Community]
  H1 --> H2[Screen 2: Find Your Tribe]
  H2 --> H3[Screen 3: Connect & Collaborate]
  H3 --> H4[Get Started]
  H1 --> S[Skip]
  H2 --> S
  H3 --> S
  S --> L1[Locality Selection]

  H4 --> L1[Locality Selection]
  L1 --> L2{Allow GPS?}
  L2 -- Yes --> L3[Use GPS → Save Locality]
  L2 -- No --> L4[Enter Locality Manually → Save]
  L3 --> I1[Interests Selection]
  L4 --> I1

  I1 --> I2[Choose Tags tech/sports/…]
  I2 --> I3[Save Interests]
  I3 --> Z[Home: Feed]
```

---

## 2. Core Tabs

### 2.1 Feed - Home
```mermaid
flowchart TD
  Z[Feed - Home] --> Z1[Pull Posts locality + time]
  Z1 --> Z2[Scroll Infinite List]
  Z2 -->|Tap| Z3[Post Detail/Comments]
  Z2 -->|Tap Event Card| EV_D[Event Detail]
  Z2 -->|Tap Group Annc| GR_D[Group Detail]
  Z --> Z4["What's on your mind? - Create Post"]

  %% Create Post
  Z4 --> P1[Composer: Text]
  P1 --> P2[Add Images optional]
  P2 --> P3[Post]
  P3 --> P4{Success?}
  P4 -- Yes --> Z[Refresh Feed + Toast]
  P4 -- No --> P5[Error Toast]

  %% Interactions on a post card
  Z2 --> L1[Like Toggle]
  Z2 --> C1[Comment → Add Comment → Post]
  Z2 --> S1[Share → System Sheet: Copy link / External Apps]

  %% Moderation & Controls
  Z2 --> M1[Report Post/User → Select Reason → Submit]
  Z2 --> M2[Hide Post]
  Z2 --> M3[Block User]
```

### 2.2 Events - Tabs: Upcoming, My Events, Past
```mermaid
flowchart TD
  E0[Events Tab] --> E1{Sub-Tab?}
  E1 -- Upcoming --> E2[Upcoming List]
  E1 -- My Events --> E3[My Registered/Hosting]
  E1 -- Past Events --> E4[Past Events]

  %% Upcoming discovery
  E2 --> E5[Filters: Date/Price/Distance/Online]
  E2 -->|Tap Card| EV_D[Event Detail]

  %% My Events
  E3 -->|Tap Card| EV_D
  E3 --> ME1[Actions: View Ticket/QR if any]
  E3 --> ME2[Cancel RSVP if allowed]

  %% Past
  E4 -->|Tap Card| EV_D
```

### 2.2.a Event Detail
```mermaid
flowchart TD
  EV_D[Event Detail] --> EV1[Banner, Title, Date/Time]
  EV_D --> EV2[Location/Map or Online Link]
  EV_D --> EV3[Description + Host Profile Link]
  EV_D --> EV4[Attendees Preview + Slots 15/50]
  EV_D --> EV5[CTA: RSVP / Register]

  %% RSVP/Register
  EV5 --> EV6{Free or Paid?}
  EV6 -- Free --> EV7[Confirm RSVP]
  EV6 -- Paid --> EV8{Payment Path}
  EV8 -- External Link --> EV9[Open Browser → Pay → Return]
  EV8 -- In-app Provider --> EV10[Checkout → Status]

  EV7 --> EV11{Success?}
  EV9 --> EV11
  EV10 --> EV11

  EV11 -- Yes --> EV12[Add to My Events + Enable Reminders + Toast]
  EV11 -- No --> EV13[Error/Cancelled → Stay on Detail]

  %% Capacity / Approval
  EV_D --> CAP1{Capacity Full?}
  CAP1 -- Yes --> CAP2[Join Waitlist → Confirm → Notify on open]
  CAP1 -- No --> EV5
  EV_D --> APR1{Approval Required?}
  APR1 -- Yes --> APR2[Request to Join → Pending → Host Decision]
  APR2 --> APR3{Approved?}
  APR3 -- Yes --> EV12
  APR3 -- No --> APR4[Notify Denied]

  %% Event Chat
  EV12 --> EC1[Auto-create Event Chat - Host + Attendees]
  EC1 --> CH_T[Open Chat Thread]
```

### 2.3 Groups - Tabs: My Groups, Discover
```mermaid
flowchart TD
  G0[Groups Tab] --> G1{Sub-Tab?}
  G1 -- My Groups --> G2[My Groups List]
  G1 -- Discover --> G3[Suggested Groups]

  G2 -->|Tap| GR_D[Group Detail]
  G3 -->|Tap| GR_D

  %% Group Detail
  GR_D --> GR1[Name, Description, Rules]
  GR_D --> GR2[Members Preview/Count]
  GR_D --> GR3[Group Feed - posts/events]
  GR_D --> GR4{Membership State?}
  GR4 -- Not a member --> GR5[Join Group CTA]
  GR4 -- Member --> GR6[Leave Group CTA]
  GR4 -- Pending --> GR7[Pending State]

  %% Join flow
  GR5 --> J1{Public or Private?}
  J1 -- Public --> J2[Instant Join → Access Feed]
  J1 -- Private --> J3[Request to Join → Pending → Admin Decision]
  J3 --> J4{Approved?}
  J4 -- Yes --> J2
  J4 -- No --> J5[Notify Denied → Suggest Similar Groups]

  %% Group Feed actions
  GR3 --> GP1[Create Post - Text/Image]
  GP1 --> GP2[Post]
  GP2 --> GP3{Success?}
  GP3 -- Yes --> GR3
  GP3 -- No --> GP4[Error Toast]
  GR3 --> GI1[Like/Comment/Share]

  %% Group Events
  GR3 --> GE1[View Group Events → Tap → Event Detail]

  %% Admin Controls if admin
  GR_D --> A1{Is Admin?}
  A1 -- Yes --> A2[Approve/Remove Members]
  A1 -- Yes --> A3[Approve/Remove Posts]
  A1 -- Yes --> A4[Pin Announcements]
  A1 -- Yes --> A5[Create Event]
```

### 2.4 Chat - List, Requests, Thread
```mermaid
flowchart TD
  C0[Chat Tab] --> C1[Conversations List]
  C1 --> C2[Unread Indicators]
  C1 -->|Tap| CH_T[Open Chat Thread]
  C1 --> CR[Chat Requests Section]
  CR -->|Accept| CH_T
  CR -->|Decline| CR1[Request Dismissed]

  %% Thread
  CH_T --> M1[Send Message - Text]
  CH_T --> M2[Attach Image/File/Voice optional]
  M1 --> M3[Delivered/Read Indicators]
  CH_T --> CT1[Thread Actions: Mute, Leave - Group/Event, Report/Block]

  %% New Chat
  C1 --> NC[Start New Chat]
  NC --> NS[Search Users/Groups]
  NS --> NS1[Select Recipient/s]
  NS1 --> CH_T
```

---

## 3. Side Navigation

### 3.1 Side Menu - Profile, Settings, Help, Logout
```mermaid
flowchart TD
  S0[Top Bar → Hamburger] --> S1[Side Menu]
  S1 --> PR[Profile]
  S1 --> ST[Settings]
  S1 --> HS[Help & Support]
  S1 --> LO[Logout]

  %% Profile
  PR --> PR1[View: avatar, name, bio, interests, stats]
  PR --> PR2[Edit Profile]
  PR2 --> PR3[Update Fields → Save]
  PR3 --> PR4{Success?}
  PR4 -- Yes --> PR
  PR4 -- No --> PR5[Error Toast]

  %% Settings
  ST --> ST1[Account]
  ST --> ST2[Notifications]
  ST --> ST3[Privacy]

  ST1 --> A1[Change Password]
  ST1 --> A2[Manage Linked Accounts - Google/Apple]

  ST2 --> N1[Toggles: Chat, Event Reminders, Group Mentions, Feed Activity]
  ST2 --> N2[Per-event/group mute optional]

  ST3 --> P1[Profile Visibility: Public/Friends/Groups-Only]
  ST3 --> P2[Discovery: Appear in Search/Discovery]
  ST3 --> P3[Show/Hide Event Attendance]

  %% Help
  HS --> H1[FAQs]
  HS --> H2[Contact/Email]
  HS --> H3[Report an Issue]

  %% Logout
  LO --> L1[Confirm]
  L1 --> L2[Clear Session]
  L2 --> C[Auth Screen]
```

---

## 4. Supplemental/Conditional

### 4.1 Event Creation - Host
```mermaid
flowchart TD
  HC0[Create Event - Events/Group] --> HC1[Form: Title, Banner, Desc]
  HC1 --> HC2[Location/Map or Online Link]
  HC2 --> HC3[Date/Time]
  HC3 --> HC4[Capacity, Fee, Refund Policy]
  HC4 --> HC5[Tags, Visibility - Public/Group-only]
  HC5 --> HC6[Publish]
  HC6 --> HC7{Success?}
  HC7 -- Yes --> HC8[Auto Post to Feed + Show in Events/Group]
  HC8 --> HC9[Create Event Chat]
  HC7 -- No --> HC10[Inline Errors / Retry]
```

### 4.2 Error & Safety - global
```mermaid
flowchart TD
  ERR0[Network Failure] --> ERR1[Retry Banner / Pull to Refresh]
  ERR0 --> ERR2[Offline Cache if any]
  SEC0[Report/Block] --> SEC1[Hidden Content + DM Prevention]
  PAY0[Payment Failed] --> PAY1[Error → Retry/Change Method]
  RSV0[RSVP Full] --> RSV1[Waitlist Join → Notify]
```

---

## 5. Master App Flow - Happy Path
```mermaid
flowchart TD
  A[App Launch] --> B{Authenticated?}
  B -- No --> C[Login/Sign Up → Google]
  C --> H[Onboarding → Locality + Interests]
  H --> Z[Feed]
  Z -->|Tap Event| EV_D[Event Detail]
  EV_D --> EV5[RSVP/Register]
  EV5 --> EV12[My Events + Reminders + Event Chat]
  EV12 --> C0[Chat Tab]
  Z --> G0[Groups Tab]
  G0 --> G3[Discover → Join Public Group]
  G3 --> GR_D[Group Detail → Group Feed]
  GR_D --> GE1[Group Events → Event Detail]
  Z --> S0[Hamburger → Side Menu]
  S0 --> PR[Profile → Edit + Save]
  S0 --> ST[Settings → Notification toggles]
  EV_D --> E0[Events Tab → My Events → Attend → Past Events]
```
