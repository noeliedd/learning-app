# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'admin@admin.com', password: 'password', password_confirmation:'password', admin: true)
User.create(email: 'user@user.com', password: 'password', password_confirmation:'password', admin: false)
Subject.create(name: 'Wireless Networking')
Topic.create(name: 'Week 1', subject_id: 1)
Topic.create(name: 'Week 2', subject_id: 1)
Quiz.create(name: 'Quiz 1', level: "Easy", topic_id: 1)
Quiz.create(name: 'Quiz 2', level: "Medium", topic_id: 1)
Quiz.create(name: 'Quiz 3', level: "Hard", topic_id: 1)

Question.create(question: "What is the wireless communications technology used in retail operations to identify and secure merchandise?", ans1: "ISM",ans2: "Micro sensors",ans3: "RFID", correctAnswer: 3 ,quiz_id: 1)
Question.create(question: "What WLAN device provides communications management services to wireless workstations?", ans1: "Access point",ans2: "Antenna",ans3: "Network adapter", correctAnswer: 1,quiz_id: 1)
Question.create(question: "What WLAN device is installed in or attached to a PC to provide an interface to a wireless network?", ans1: "Access point",ans2: "Antenna",ans3: "Network adapter", correctAnswer: 3 ,quiz_id: 1)
Question.create(question: "What industry association develops, publishes, and maintains the standards for wireless networks?", ans1: "FCC",ans2: "IEEE ",ans3: "UNII", correctAnswer:2 ,quiz_id: 1)
Question.create(question: "What is the term used to describe the ability for networking devices from different manufacturers to communicate effectively?", ans1: "Accessible",ans2: "Interoperable",ans3: "Portable", correctAnswer:2 ,quiz_id: 1)
Question.create(question: "Which of the FCC's RF bands operates in the frequency range of 2.4 GHz to 2.4835 GHz?", ans1: "ISM",ans2: "RFID",ans3: "SOHO", correctAnswer:1 ,quiz_id: 1)
Question.create(question: "What is the term used to identify the broadcast or generated electrical signals that can disrupt wireless communications", ans1: "ISM",ans2: "FCC",ans3: "RFI", correctAnswer:3 ,quiz_id: 1)
Question.create(question: "What is the acronym used to identify a single remote network that typically connects to another network to conduct its work?", ans1: "Enterprise network",ans2: "HOSO",ans3: "SOHO", correctAnswer:3 ,quiz_id: 1)
Question.create(question: "What is the term used to describe the ability of a network technology to be easily resized to meet the growing or changing requirements of an organization?", ans1: "Interoperability",ans2: "Portability",ans3: "Scalability ", correctAnswer:3 ,quiz_id: 1)
Question.create(question: "Which of the FCC's RF bands operates in the frequency range of 4.9 GHz to 5.825 GHz?", ans1: "RFID",ans2: "SOHO",ans3: "UNII ", correctAnswer: 3,quiz_id: 1)

Question.create(question: "What wireless mode is being used by a student who uses a wireless connection to link to her lab partner's notebook PC in a study hall?", ans1: "Ad-hoc",ans2: "Infrastructure",ans3: "Fixed-base", correctAnswer:1 ,quiz_id: 2)
Question.create(question: "What type of network dynamically interconnects mobile wireless devices, which must include routing capabilities?", ans1: "Ad-hoc",ans2: "MANET",ans3: "MONET", correctAnswer:2 ,quiz_id: 2)
Question.create(question: "What wireless network mode is being used when an office worker connects to a WLAN BSS from his desktop?", ans1: "Ad-hoc",ans2: " Infrastructure ",ans3: "Fixed-base", correctAnswer:2 ,quiz_id: 2)
Question.create(question: "What is the acronym used to indicate a network that provides support for a single user in a 10-meter range?", ans1: "CAN",ans2: "MAN",ans3: "PAN", correctAnswer:3 ,quiz_id: 2)
Question.create(question: "What is the working space, the size of which is defined by the wireless technology in use, surrounding a wireless user?", ans1: "POT",ans2: "PAT",ans3: "POS", correctAnswer: 3,quiz_id: 2)
Question.create(question: "What type of base station is associated with ad-hoc and peer-to-peer wireless networking?", ans1: "BSS",ans2: "BSS",ans3: "IBSS ", correctAnswer: 3,quiz_id: 2)
Question.create(question: "Which of the following is used to describe a public, campus, or building area where users are able to establish wireless connections to a network?", ans1: "CAN",ans2: "Hotspot",ans3: "Open source", correctAnswer:2,quiz_id: 2)
Question.create(question: "What is the acronym given to a wireless network defined into a specific area?", ans1: "CAN",ans2: "WAN",ans3: "WLAN ", correctAnswer: 3,quiz_id: 2)
Question.create(question: "This mode of wireless network allows devices to communicate directly with each other.", ans1: "physical",ans2: "digital",ans3: "ad-hoc", correctAnswer: 3,quiz_id: 2)
Question.create(question: "One of the following is developing MANET standards for use in Internet access.", ans1: "IEEE",ans2: "IERF",ans3: "DARPS", correctAnswer:2 ,quiz_id: 2)
Question.create(question: "Which one of the following is not an advantage of an infrastructure WLAN over an ad-hoc wireless network?", ans1: "Security",ans2: "Scalability",ans3: "Portability", correctAnswer: 3,quiz_id: 2)

Question.create(question: "Which of the following wireless transmission phenomenon cause ISI?", ans1: "FHSS",ans2: "Singlepath propagation",ans3: "Multipath propagation ", correctAnswer:3 ,quiz_id: 3)
Question.create(question: "What is the modulation method used with 802.11a PHY?", ans1: "QAM",ans2: "OFDM ",ans3: "DSSS", correctAnswer:2 ,quiz_id: 3)
Question.create(question: "On which 802.11x topology are frames forwarded between access points within the same network?", ans1: "BSS",ans2: "Peer-to-peer ",ans3: "ESS ", correctAnswer:3 ,quiz_id: 3)
Question.create(question: "Which of the following IEEE 802.11 standards does not define a PHY layer?", ans1: "802.11b",ans2: "802.11a",ans3: "802.11i ", correctAnswer:3 ,quiz_id: 3)
Question.create(question: "Which of the following IEEE 802.11 standards supports data rates of 100 Mbps?", ans1: "802.11h",ans2: "802.11n",ans3: "802.11c", correctAnswer:2 ,quiz_id: 3)
Question.create(question: "What term is used to represent the physical layer of an 802.11x standard?", ans1: "PHY",ans2: "WLAN",ans3: "PYC", correctAnswer: 1,quiz_id: 3)
Question.create(question: "What is the current designation for the original IEEE 802.11 standard?", ans1: "802.11a",ans2: "802.11b",ans3: "802.11 Legacy", correctAnswer:3 ,quiz_id: 3)
Question.create(question: "What is the term used to represent the IEEE 802.11 layer that controls access to the medium?", ans1: "BSS",ans2: "WLAN",ans3: "MAC", correctAnswer:3 ,quiz_id: 3)
Question.create(question: "What is the 802.11b topology that arranges wireless stations in a peer-to-peer network?", ans1: "ESS",ans2: "BSS",ans3: "Ad-hoc", correctAnswer:3 ,quiz_id: 3)
Question.create(question: "What networking structure do the 802.11 standards define?", ans1: "WPAN",ans2: "WMAN",ans3: "WLAN", correctAnswer: 3,quiz_id: 3)
Question.create(question: "Which one of the IEEE 802 committees is tasked with the development of security standards?", ans1: "802.10",ans2: "802.15",ans3: "802.11", correctAnswer:1 ,quiz_id: 3)