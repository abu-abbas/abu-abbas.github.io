import rawCvData from './cvData.json';

export type Role = {
  title: string;
  period: string;
};

export type Experience = {
  company: string;
  roles: Role[];
  bullets: string[];
};

export type SkillGroup = {
  title: string;
  content: string;
};

export type Project = {
  title: string;
  description: string;
};

export type CVData = {
  name: string;
  tagline: string;
  contact: {
    email: string;
    phone: string;
    github: string;
    website: string;
  };
  experiences: Experience[];
  skillGroups: SkillGroup[];
  selectedProjects: Project[];
  interests: string[];
};

export const cvData = rawCvData as CVData;
