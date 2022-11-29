// TODO
// - [ ] Generate the `_links` inside of ./_data/x/*.yml, where x = db, jobs, languages, os, tools using ./_data/projects and ./data/schools
// - [ ] Generate `self` where x = db, jobs, languages, projects, schools, tools

import * as fs from 'fs'
import * as YAML from 'yaml'
import * as path from 'path'

interface Project {
  url: string
  languages?: Skill[]
}

interface Skill {
  url: string
  projects?: Project[]
}

const db: Skill[] = buildSkill('db')
const jobs: Skill[] = buildSkill('jobs')
const languages: Skill[] = buildSkill('languages')
const os: Skill[] = buildSkill('os')
const tools: Skill[] = buildSkill('tools')
updateData()
writeSkill('db', db)
writeSkill('jobs', jobs)
writeSkill('languages', languages)
writeSkill('os', os)
writeSkill('tools', tools)

function updateData() {
  const projectFiles = fs.readdirSync('./_data/projects')
  for (const projectFile of projectFiles) {
    const projectURL = `/projects/${path.parse(projectFile).name}/`
    const contents = fs.readFileSync(`./_data/projects/${projectFile}`, 'utf8')
    const data = YAML.parse(contents)

    updateLinkedSkill(db, projectURL, data._links.db)
    updateLinkedSkill(jobs, projectURL, data._links.jobs)
    updateLinkedSkill(languages, projectURL, data._links.languages)
    updateLinkedSkill(os, projectURL, data._links.os)
    updateLinkedSkill(tools, projectURL, data._links.tools)
  }
}

function buildSkill(urlFragment: string): Skill[] {
  const files = fs.readdirSync(`./_data/${urlFragment}`)
  const urls = files.map(j => `/${urlFragment}/${path.parse(j).name}/`)
  const skills: Skill[] = []
  for (const url of urls) {
    skills.push({url: url, projects: []})
  }
  return skills
}

function updateLinkedSkill(skills: Skill[], projectURL: string, links: any[]) {
  if (links) {
    for (const link of links) {
      const skill = skills.find(s => s.url === link.href)
      if (!skill) throw `${link.href} is missing`
      skill.projects.push({url: projectURL})
    }
  }
}

function writeSkill(urlFragment: string, skills: Skill[]) {
  for (const skill of skills) {
    if (skill.projects.length < 1) continue
    const filePath = `_data/${urlFragment}/${path.parse(skill.url).name}.yml`
    console.log(filePath)
    const contents = fs.readFileSync(filePath, 'utf8')
    const data = YAML.parse(contents)
    if (!data._links) data._links = {}
    data._links.projects = skill.projects.map(p => { return {href: p.url}})
    fs.writeFileSync(filePath, YAML.stringify(data))
  }
}
