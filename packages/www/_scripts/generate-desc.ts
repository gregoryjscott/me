import OpenAI from "openai"
import { writeMarkdown } from "./util"
import { getResources, Resource } from "./get-resources"

const resources: Resource[] = getResources()
const resourcesWithPrompts = resources.filter(r => r.prompt && !r.isIndex)

async function generateDesc() {
  for (const resource of resourcesWithPrompts) {
    const hasDesc =
      resource.sourceMarkdown.data.desc &&
      resource.sourceMarkdown.data.desc.length > 0
    if (hasDesc) continue

    const promptOutput = (await runPrompt(resource.prompt)).trim()
    resource.sourceMarkdown.data.desc = promptOutput
    writeMarkdown(
      resource.sourceMarkdown.path,
      resource.sourceMarkdown.content,
      resource.sourceMarkdown.data
    )
  }
}

async function runPrompt(prompt: string): Promise<string> {
  const client = new OpenAI()
  const response = await client.responses.create({
    model: "o4-mini",
    input: prompt,
  })
  return response.output_text
}

process.on("unhandledRejection", err => {
  console.error("There was an uncaught error", err)
  process.exit(1)
})

generateDesc()
